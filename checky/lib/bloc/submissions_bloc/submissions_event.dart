part of 'submissions_bloc.dart';

abstract class SubmissionsEvent {}

final class GetAttemptsEvent extends SubmissionsEvent {
  final int assignmentId;

  GetAttemptsEvent(this.assignmentId);
}

final class GetAllUserAttemptsEvent extends SubmissionsEvent {
  final String userId;

  GetAllUserAttemptsEvent({required this.userId});
}
