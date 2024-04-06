import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:schedular_application/student/presentation/constants/app_colors.dart';
import 'package:schedular_application/student/presentation/widgets/common_button.dart';
import 'package:sizer/sizer.dart';
import '../constants/text_style.dart';
import '../widgets/text_fields.dart';
class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}
class _ForgetScreenState extends State<ForgetScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 17.4.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forget Password",
                            style: TextHelper.size20.copyWith(fontSize: 30, fontWeight: FontWeight.w600, color: ColorsForApp.headingPageColor),
                          )
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Row(
                        children: [
                          Text("Mail ID", style: TextHelper.h7.copyWith(fontWeight: FontWeight.w600),)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18,),
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
                      // Row(
                      //   children: [
                      //     Text("Password", style: TextHelper.h7.copyWith(fontWeight: FontWeight.w600),)
                      //   ],
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 12,),
                      //   child: CustomTextField(
                      //     prefixIcon: Icon(Icons.lock_outline_sharp),
                      //     hintText: "Type Your password",
                      //     hintTextColor: Colors.black.withOpacity(0.6),
                      //     validator: (value){
                      //       if(value!.isEmpty) {
                      //         return "Please Enter Password";
                      //       }
                      //     },
                      //   ),
                      // ),
                      SizedBox(height: 1.h,),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Text("Forgot password", style: TextHelper.h8.copyWith(fontWeight: FontWeight.w500, fontSize: 15),)
                      //   ],
                      // ),
                      SizedBox(height: 4.3.h,),
                    ],
                  ),
                  CommonButton(
                    onpressed: () {
                      Navigator.pushNamed(context, "home_screen");

                      // if (loginKey.currentState!.validate()) {
                      //
                      // }

                    },
                    buttonText: "Send",
                    // buttonColor: Colors.red,
                  ),
                ],
              ),
            ),
            // SizedBox(height: 1.5.h,),
            SizedBox(
              height: 28.3.h,
              width: 100.w,
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.pink.withOpacity(0.8),
                      image: DecorationImage(
                          image:AssetImage("assets/images/AppLogo.png"),fit: BoxFit.cover )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

