import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:testing/src/core/values/enum.dart';
part 'alert_state.dart';

class AlertCubit extends Cubit<AlertState> {
  AlertCubit() : super(AlertInitial());

  Future showDialog(ShowDialogEvent event) async{
    emit(event);
  }
}
