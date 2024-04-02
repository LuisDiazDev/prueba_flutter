part of 'session_cubit.dart';

class SessionState extends Equatable {

  final String? state;
  final SessionStatus? sessionStatus;

  const SessionState({
    this.state = '',
    this.sessionStatus = SessionStatus.none,
  });

  SessionState copyWith({
    bool? isAuthenticated,
    String? state,
    String? uuid,
    SessionStatus? sessionStatus,
    String? id,
  }) =>
      SessionState(
          state: state ?? this.state,
          sessionStatus: sessionStatus ?? this.sessionStatus);

  factory SessionState.fromJson(Map<String, dynamic> json) => SessionState(
    state: json['state'] as String?,
    sessionStatus: SessionStatus.values.firstWhere(
          (element) => element.toString() == json['sessionStatus'],
    ),
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'state': state,
    'sessionStatus': SessionStatus.none.toString(),
  };

  @override
  List<Object?> get props => [state];
}
