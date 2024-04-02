import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/src/modules/alerts/alert_cubit.dart';
import 'package:testing/src/modules/home/bloc/home_events.dart';
import 'package:testing/src/modules/home/bloc/home_state.dart';
import 'package:testing/src/modules/session/session_cubit.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AlertCubit alertCubit;
  final SessionCubit sessionCubit;

  HomeBloc(this.alertCubit, this.sessionCubit) : super(const HomeState());
}
