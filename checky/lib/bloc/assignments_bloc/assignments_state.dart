part of 'assignments_bloc.dart';

abstract class AssignmentsState {}

final class AssignmentsInitial extends AssignmentsState {}

final class GetAssignmentsSuccessfulState extends AssignmentsState {
  final List<Assignment>? assignments;

  GetAssignmentsSuccessfulState(this.assignments);
}

final class NoAssignmentsFoundState extends AssignmentsState {}

final class AssignmentsLoadingState extends AssignmentsState {}

final class AssignmentsErrorState extends AssignmentsState {}
