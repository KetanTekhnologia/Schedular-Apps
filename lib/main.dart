import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:schedular_application/student/bloc/confirmpasswordbloc/confirmpassword_bloc.dart';
import 'package:schedular_application/student/bloc/forgetbloc/forget_bloc.dart';
import 'package:schedular_application/student/bloc/homebloc/home_bloc.dart';
import 'package:schedular_application/student/bloc/loginbloc/login_bloc.dart';
import 'package:schedular_application/student/bloc/otpbloc/otp_bloc.dart';
import 'package:schedular_application/student/routes/routes.dart';
import 'package:schedular_application/student/presentation/widgets/common_button.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());

  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
 // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(),
            ),
            BlocProvider<ForgetBloc>(
              create: (context)=>ForgetBloc(),
            ),
            BlocProvider<HomeBloc>(
              create: (context)=>HomeBloc(),
            ),
            BlocProvider<OtpBloc>(
              create: (context)=>OtpBloc(),
            ),
            BlocProvider<ConfirmPasswordBloc>(
              create: (context)=>ConfirmPasswordBloc(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Scheduller Application',
            // theme: ThemeData(
            //   colorScheme: ColorScheme.fromSwatch(
            //     primarySwatch: Colors.deepPurple,
            //   ).copyWith(
            //   ),
            //   useMaterial3: true,
            // ),
            onGenerateRoute: Routes.generateRoute,
            initialRoute: 'login_screen',
          ),
        );
      },
    );
  }
}
