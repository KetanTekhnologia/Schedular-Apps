import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../constants/app_colors.dart';
import '../constants/text_style.dart';
import '../widgets/common_button.dart';
import '../widgets/text_fields.dart';

class OTPVarificationScreen extends StatefulWidget {
  const OTPVarificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVarificationScreen> createState() => _OTPVarificationScreenState();
}

class _OTPVarificationScreenState extends State<OTPVarificationScreen> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 18.h,),
          Padding(
            padding: EdgeInsets.symmetric(vertical:4.45.h, horizontal: 6.w),            child: Column(
            children: [
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "OTP Varification",
                          style: TextHelper.size20.copyWith(fontSize: 30, fontWeight: FontWeight.w600, color: ColorsForApp.headingPageColor),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text("Enter OTP",
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize:18)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1.h),
                      child: CustomTextField(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Type OTP Code",
                        hintTextColor: Colors.black.withOpacity(0.6),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter OTP Code";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),
          SizedBox(height: 4.85.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.sp),
            child: CommonButton(
              buttonText: "Send",
              onpressed: () {
                if (loginKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "confirm_password_screen");
                }
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset("assets/images/AppLogo.png", height: 35.95.h, width: 100.w, fit: BoxFit.fill),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
