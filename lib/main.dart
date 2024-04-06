import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:schedular_application/student/bloc/loginbloc/login_bloc.dart';
import 'package:schedular_application/student/routes/routes.dart';
import 'package:schedular_application/student/presentation/widgets/common_button.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
            onGenerateRoute: Routes.generateRoute,
            initialRoute: 'login_screen',
            // home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        );
      },
    );
  }
}
