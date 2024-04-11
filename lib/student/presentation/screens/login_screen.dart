import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedular_application/student/bloc/loginbloc/login_bloc.dart';
import 'package:sizer/sizer.dart';
import '../constants/app_colors.dart';
import '../constants/text_style.dart';
import '../widgets/common_button.dart';
import '../widgets/text_fields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer(
        bloc: LoginBloc(),

        child: Column(
          children: [
            SizedBox(height: 8.80.h,),
            Padding(
              padding: EdgeInsets.symmetric(vertical:4.80.h, horizontal: 6.w),
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
                              "Log in",
                              style: TextHelper.size20.copyWith(fontSize: 30, fontWeight: FontWeight.w600, color: ColorsForApp.headingPageColor),
                            )
                          ],
                        ),
                        SizedBox(height: 10.h),
                         const Row(
                          children: [
                            Text("Username",
                                style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: CustomTextField(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Type Your Username",
                            hintTextColor: Colors.black.withOpacity(0.6),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Username";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: CustomTextField(
                            prefixIcon: Icon(Icons.lock_outline_sharp),
                            hintText: "Type Your password",
                            hintTextColor: Colors.black.withOpacity(0.6),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Password";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              child: Text(
                                "Forgot password",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp),
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, "forget_screen");
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.sp),
              child: CommonButton(
                buttonText: "Login",
                onpressed: () {
                if (loginKey.currentState!.validate()) {
                  Navigator.pushNamed(context, "home_screen");
                }
              },
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/AppLogo.png", height: 35.95.h, width: 100.w, fit: BoxFit.fill),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
