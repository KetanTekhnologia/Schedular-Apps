import 'package:flutter/material.dart';
import 'package:schedular_application/utils/app_colors.dart';
import 'package:schedular_application/utils/text_style.dart';
import 'package:schedular_application/widgets/common_button.dart';
import 'package:sizer/sizer.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login",style:TextHelper.size20.copyWith(fontSize: 32,fontWeight: FontWeight.w600,color: ColorsForApp.headingPageColor),)
                ],
              ),
              
              SizedBox(height: 8.h,),
              
              Row(
                children: [
                  Text("Username",style: TextHelper.h7.copyWith(fontWeight: FontWeight.w600),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,size: 25,),
                    labelText: "Type Your Username",
                    labelStyle: TextHelper.h9,
                    filled: true,
                    fillColor:Colors.grey.shade100,
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(color: Colors.black),
                    )
                  ),
                ),
              ),
              
              SizedBox(height:5.h,),
              
              Row(
                children: [
                  Text("Password",style: TextHelper.h7.copyWith(fontWeight: FontWeight.w600),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Type Your password",
                      labelStyle: TextHelper.h9,
                      filled: true,
                      fillColor:Colors.grey.shade100,
                      border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9),
                        borderSide: BorderSide(color: Colors.black),
                      )
                  ),
                ),
              ),
        
              SizedBox(height:2.h,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot password",style:TextHelper.h8,)
                ],
              ),
        
              SizedBox(height:5.h,),
        
              CommonButton(
                  onpressed: (){
        
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
