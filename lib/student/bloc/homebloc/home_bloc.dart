

import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent,HomeState>
{
  HomeBloc(): super(InitialState())
  {
    on<HomeEvent>((event,emit) => emit(HomeState()));
    on<HomeEvent>((event, emit) => emit(HomeState()));

  }
}