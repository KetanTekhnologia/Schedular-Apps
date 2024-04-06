import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedular_application/student/bloc/confirmpasswordbloc/confirmpassword_bloc.dart';
import 'package:schedular_application/student/bloc/forgetbloc/forget_bloc.dart';
import 'package:schedular_application/student/bloc/otpbloc/otp_bloc.dart';
import 'package:schedular_application/student/presentation/screens/confirm_password.dart';
import 'package:schedular_application/student/presentation/screens/forgot_password_screen.dart';
import 'package:schedular_application/student/presentation/screens/otp_varification.dart';

import '../bloc/homebloc/home_bloc.dart';
import '../bloc/loginbloc/login_bloc.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';


class Routes {
  static Route<dynamic>
  generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login_screen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          ),
        );
      case 'home_screen':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeBloc(),
            child: HomeScreen(),
          ),
        );
      case 'forget_screen':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create:(context) => ForgetBloc(),
            child:ForgetScreen(),
              )
        );
      case 'confirm_password_screen':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create:(context) => ConfirmPasswordBloc(),
              child:ConfirmPasswordScreen(),
            )
        );
      case 'otp_screen':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create:(context) => OtpBloc(),
              child:OTPVarificationScreen(),
            )
        );
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}