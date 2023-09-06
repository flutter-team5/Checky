import 'package:checky/model/submission_model.dart';
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
      .from('test_case')
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
