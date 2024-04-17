import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../constants/app_colors.dart';
import '../constants/text_style.dart';
import '../widgets/common_button.dart';
import '../widgets/text_fields.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();
  String? phoneNumberError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.45.h, horizontal: 6.w),
            child: Column(
              children: [
                Form(
                  key: loginKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot Password",
                            style: TextHelper.size20.copyWith(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: ColorsForApp.headingPageColor),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text("Contact No",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: CustomTextField(
                          controller: mobileController,
                          prefixIcon: Icon(Icons.person),
                          keyboardType: TextInputType.phone,
                          hintText: "Type Your Contact Number",
                          hintTextColor: Colors.black.withOpacity(0.6),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          onChange: (value) {
                            setState(() {
                              phoneNumberError = !isValidPhoneNumber(value)
                                  ? 'Invalid phone number'
                                  : null;
                              if (value.length > 10) {
                                mobileController.text = value.substring(0, 10);
                              }
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Mobile Number";
                            } else if (value.length != 10) {
                              return "Please Enter a 10-digit Phone Number";
                            }
                            return null;
                          },
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 4.85.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.sp),
            child: CommonButton(
              buttonText: "Send",
              onpressed: () {
                if (loginKey.currentState!.validate() && isValidPhoneNumber(mobileController.text) ) {
                  Navigator.pushNamed(context, "otp_screen");
                }
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/images/AppLogo.png",
                    height: 35.95.h, width: 100.w, fit: BoxFit.fill),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool isValidPhoneNumber(String phoneNumber) {
    RegExp phoneRegex = RegExp(r'^[0-9]{10}$');
    return phoneRegex.hasMatch(phoneNumber);
  }
}
