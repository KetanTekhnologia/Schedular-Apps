import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedular_application/student/features/login/bloc/login_bloc.dart';

import '../features/login/ui/login_screen.dart';

class Routes {
  static Route<dynamic>
  generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login_page':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginBloc(),
            child: LoginScreen(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}