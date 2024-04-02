import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../core/values/enum.dart';

part 'session_state.dart';

class SessionCubit extends HydratedCubit<SessionState> {
  SessionCubit() : super(const SessionState());

  Future<void> verify() async {
    //todo load data from data base and api
    await Future.delayed(const Duration(seconds: 2));
    emit(const SessionState(sessionStatus: SessionStatus.started,));
  }

  Future<void> changeState(SessionState newState) async {
    emit(newState);
  }


  @override
  SessionState? fromJson(Map<String, dynamic> json) {
    return SessionState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SessionState state) {
    return state.toJson();
  }

}
