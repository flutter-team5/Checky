part of 'assignments_bloc.dart';

abstract class AssignmentsEvent {}

final class GetAssignmentsEvent extends AssignmentsEvent {}

final class GetUserAssignmentsEvent extends AssignmentsEvent {
  final String userId;

  GetUserAssignmentsEvent({required this.userId});

  
}

