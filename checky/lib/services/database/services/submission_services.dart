import 'package:checky/model/submission_model.dart';
import 'package:checky/model/user_profile_model.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<Submission>?> getSubmissions() async {
  final supabase = Supabase.instance.client;
  final List submissionsJson = await supabase.from('submission').select();
  final List<Submission> submissions = [];
  for (final submissionJson in submissionsJson) {
    submissions.add(Submission.fromJson(submissionJson));
  }
  return submissions;
}

Future<List<Submission>?> getUserSubmissionsByUUID(String userId) async {
  final UserProfile profile =  await getUserProfileByUserId(Supabase.instance.client.auth.currentUser!.id);
  return await getUserSubmissions(profile.id!);
}

Future<List<Submission>?> getUserSubmissions(int userId) async {
  final supabase = Supabase.instance.client;
  final List submissionsJson = await supabase.from('submission').select().eq("user_id", userId);
  final List<Submission> submissions = [];
  for (final submissionJson in submissionsJson) {
    submissions.add(Submission.fromJson(submissionJson));
  }
  return submissions;
}

Future<Submission> getSubmissionById(int id) async {
  final supabase = Supabase.instance.client;
  final Map submissionJson =
      await supabase.from('submission').select().eq("id", id).single();
  return Submission.fromJson(submissionJson);
}

Future<List<Submission>?> getUserSubmissionsOnAssignment(
    int assignmentId, int userId) async {
  final supabase = Supabase.instance.client;
  final List submissionsJson = await supabase
      .from('submission')
      .select()
      .eq("assignment_id", assignmentId)
      .eq("user_id", userId);
      
  final List<Submission> submissions = [];
  for (final submissionJson in submissionsJson) {
    submissions.add(Submission.fromJson(submissionJson));
  }
  return submissions;
}

Future<List<Submission>?> getSubmissionsForAssignment(int assignmentId) async {
  final supabase = Supabase.instance.client;
  final List submissionsJson = await supabase
      .from('submission')
      .select()
      .eq("assignment_id", assignmentId);
  final List<Submission> submissions = [];
  for (final submissionJson in submissionsJson) {
    submissions.add(Submission.fromJson(submissionJson));
  }
  return submissions;
}

Future<Submission> getUserHighestLastAttempt(
    int assignmentId, int userId) async {
  List<Submission>? submissions =
      await getUserSubmissionsOnAssignment(assignmentId, userId);
  submissions = submissions?.reversed.toList();
  Submission highestLastAttempt = submissions![0];

  for (var submission in submissions) {
    if (submission.marksAquired! > highestLastAttempt.marksAquired!) {
      highestLastAttempt = submission;
    }
  }

  return highestLastAttempt;
}

Future<List<Submission>?> getUsersFinalAttempt(int assignmentId) async {
  List<UserProfile>? users = await getUserSubmittedToAssignment(assignmentId);
  List<Submission> finalAttempts = [];

  for (var user in users!) {
    finalAttempts.add(await getUserHighestLastAttempt(assignmentId, user.id!));
  }
  return finalAttempts;
}

Future insertSubmission(Map submission) async {
  final supabase = Supabase.instance.client;
  await supabase.from('submission').insert(submission);
}
