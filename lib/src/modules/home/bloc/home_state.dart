import 'package:equatable/equatable.dart';
import 'package:testing/src/models/task_models.dart';

class HomeState extends Equatable {

  final bool? isLoading;
  final List<TaskModel> ships;

  const HomeState({
    this.isLoading = false,
    this.ships =const [],
  });


  HomeState copyWith({
    bool? isLoading,
    List<TaskModel>? ships,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      ships: ships ?? this.ships
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
  ];
}