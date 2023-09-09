import 'package:checky/model/submission_model.dart';
import 'package:checky/model/user_profile_model.dart';
import 'package:checky/services/database/services/submission_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<UserProfile> getUserProfileById(int id) async {
  final supabase = Supabase.instance.client;
  final Map userProfileJson =
      await supabase.from('user_profile').select().eq("id", id).single();
  return UserProfile.fromJson(userProfileJson);
}

Future<UserProfile> getUserProfileByUserId(String userId) async {
  final supabase = Supabase.instance.client;
  final Map userProfileJson = await supabase
      .from('user_profile')
      .select()
      .eq("user_id", userId)
      .single();
  return UserProfile.fromJson(userProfileJson);
}

Future<List<UserProfile>?> getUserSubmittedToAssignment(
    int assignmentId) async {
  List<int> usersId = [];
  List<UserProfile> users = [];
  List<Submission> submissions =
      await getSubmissionsForAssignment(assignmentId) ?? [];

  for (var submission in submissions) {
    var userId = submission.userId!;
    if (!usersId.contains(userId)) {
      usersId.add(userId);
      users.add(await getUserProfileById(userId));
    }
  }
  return users;
}

Future insertProfile(Map profile) async {
  final supabase = Supabase.instance.client;
  await supabase.from('user_profile').insert(profile);
}
