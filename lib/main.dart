import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedular_application/student/features/login/bloc/login_bloc.dart';
import 'package:schedular_application/student/features/login/ui/login_screen.dart';
import 'package:schedular_application/student/routes/routes.dart';
import 'package:schedular_application/widgets/common_button.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ( BuildContext context,Orientation orientation,DeviceType deviceType) {
        return BlocProvider(
          create: (context) => LoginBloc(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            // onGenerateRoute: Routes.generateRoute,
            // initialRoute: 'login_page',
            home: LoginScreen()
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        );
      },

    );
  }
}
