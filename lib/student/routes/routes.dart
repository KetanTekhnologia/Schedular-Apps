import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}