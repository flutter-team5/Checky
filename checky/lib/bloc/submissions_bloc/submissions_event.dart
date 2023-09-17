part of 'submissions_bloc.dart';

abstract class SubmissionsEvent {}

final class GetAttemptsOnAssignmentEvent extends SubmissionsEvent {
  final int assignmentId;

  GetAttemptsOnAssignmentEvent(this.assignmentId);
}

final class GetAllUserAttemptsEvent extends SubmissionsEvent {
  final String userId;

  GetAllUserAttemptsEvent({required this.userId});
}
