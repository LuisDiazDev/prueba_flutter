part of 'alert_cubit.dart';

@immutable
abstract class AlertState {}

class AlertInitial extends AlertState {}

class ShowDialogEvent extends AlertState {
  final String title;
  final String message;
  final AlertType type;
  final Map<String, dynamic>? metadata;
  final List<Widget>? actions;
  final Exception? error;
  final Function? onTap;

  ShowDialogEvent({
    required this.title,
    required this.message,
    required this.type,
    this.metadata,
    this.actions,
    this.error,
    this.onTap,
  });
}