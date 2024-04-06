

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>
{
    LoginBloc(): super(InitialState())
    {
        on<LoginSuccesfulEvent>((event,emit) => emit(LoginSuccesfullState()));
        on<LoginUnSuccesfulEvent>((event, emit) => emit(LoginUnsuccesfullState()));

    }
}