import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:schedular_application/student/presentation/constants/app_colors.dart';
import 'package:schedular_application/student/presentation/widgets/common_button.dart';
import 'package:sizer/sizer.dart';
import '../constants/text_style.dart';
import '../widgets/text_fields.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 5));
    FlutterNativeSplash.remove();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: [
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    SizedBox(height: 10.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextHelper.size20.copyWith(fontSize: 42, fontWeight: FontWeight.w600, color: ColorsForApp.headingPageColor),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h,),
                    Row(
                      children: [
                        Text("Username", style: TextHelper.h7.copyWith(fontWeight: FontWeight.w600),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12,),
                      child: CustomTextField(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Type Your Username",
                        hintTextColor: Colors.black.withOpacity(0.6),
                        validator: (value){
                          if(value!.isEmpty) {
                            return "Please Enter Username";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                        Text("Password", style: TextHelper.h7.copyWith(fontWeight: FontWeight.w600),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12,),
                      child: CustomTextField(
                        prefixIcon: Icon(Icons.lock_outline_sharp),
                        hintText: "Type Your password",
                        hintTextColor: Colors.black.withOpacity(0.6),
                        validator: (value){
                          if(value!.isEmpty) {
                            return "Please Enter Password";
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot password", style: TextHelper.h8.copyWith(fontWeight: FontWeight.w500, fontSize: 15),)
                      ],
                    ),
                    SizedBox(height: 5.h,),
                  ],
                ),
              ),
              CommonButton(
                onpressed: () {
                  if (loginKey.currentState!.validate()) {
                    Navigator.pushNamed(context, "home_screen");
                  }
                },
                buttonText: "Login",
                // buttonColor: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}

