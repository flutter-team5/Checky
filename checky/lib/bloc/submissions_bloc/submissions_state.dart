part of 'submissions_bloc.dart';

abstract class SubmissionsState {}

final class SubmissionsInitial extends SubmissionsState {}

final class GetAttemptsSuccessfulState extends SubmissionsState {
  final List<Submission>? submissions;

  GetAttemptsSuccessfulState(this.submissions);
}

final class NoAttemptsFoundState extends SubmissionsState {}

final class AttemptsLoadingState extends SubmissionsState {}

final class AttemptsErrorState extends SubmissionsState {}
