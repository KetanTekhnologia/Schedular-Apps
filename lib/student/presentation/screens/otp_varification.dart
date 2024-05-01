import 'dart:async';
import 'dart:developer'; // Import for using log function
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import 'home_screen.dart';

class OTPScreens extends StatefulWidget {
  final String verificationId; // Add this line

  OTPScreens({required this.verificationId}); // Add this constructor

  @override
  _OTPScreensState createState() => _OTPScreensState();
}

class _OTPScreensState extends State<OTPScreens> {
  Timer? _timer;
  int _countdown = 60;
  TextEditingController _otpController = TextEditingController(); // Renamed variable

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (timer) {
        setState(() {
          if (_countdown == 0) {
            timer.cancel();
            // Handle timeout, maybe resend OTP or show an error message
          } else {
            _countdown--;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Otp Verification",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorsForApp.headingPageColor,
                      fontSize: 18.sp,
                    ),
                  )
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                'OTP will be valid for $_countdown seconds',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _otpController,
                decoration: InputDecoration(
                  hintText: "Enter OTP",
                ),
              ),
              SizedBox(height: 40.sp),
              GestureDetector(
                onTap: () async {
                  if (_countdown == 0) {
                    // Reset timer and change submit text to reset
                    _countdown = 60;
                    startTimer();
                    setState(() {});
                  } else {
                    try {
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: _otpController.text.toString(),
                      );
                      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      });
                    } catch (ex) {
                      log(ex.toString());
                      // Handle error, show error message to the user
                    }
                  }
                },
                child: Container(
                  height: 6.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF1066FF).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      _countdown == 0 ? "Reset" : "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
