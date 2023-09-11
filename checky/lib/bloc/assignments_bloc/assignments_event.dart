part of 'assignments_bloc.dart';

abstract class AssignmentsEvent {}

final class GetAssignmentsEvent extends AssignmentsEvent {}

final class GetUserAssignmentsEvent extends AssignmentsEvent {
  final String userId;

  GetUserAssignmentsEvent({required this.userId});

}

final class SearchForAssignmentsEvent extends AssignmentsEvent {
  final String searchTerm;

  SearchForAssignmentsEvent({required this.searchTerm});

}

