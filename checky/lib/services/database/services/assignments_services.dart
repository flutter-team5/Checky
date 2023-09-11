import 'package:checky/model/assignment_model.dart';
import 'package:checky/model/user_profile_model.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<Assignment>?> getAssignments() async {
  final supabase = Supabase.instance.client;
  final List asssignmentsJson = await supabase.from('assignment').select();
  final List<Assignment>? assignments = [];
  for (final assignmentJson in asssignmentsJson) {
    Assignment assignment = Assignment.fromJson(assignmentJson);
    assignments?.add(assignment);
  }
  return assignments?.reversed.toList();
}

Future<List<Assignment>?> getAssignmentsByAuthor(String userId) async {
  final UserProfile profile =  await getUserProfileByUserId(Supabase.instance.client.auth.currentUser!.id);
  return await getAssignmentsByAuthorProfile(profile.id!);
}

Future<List<Assignment>?> getAssignmentsByAuthorProfile(int userId) async {
  final supabase = Supabase.instance.client;
  final List asssignmentsJson =
      await supabase.from('assignment').select().eq("user_id", userId);
  final List<Assignment>? assignments = [];
  for (final assignmentJson in asssignmentsJson) {
    Assignment assignment = Assignment.fromJson(assignmentJson);
    assignments?.add(assignment);
  }
  return assignments?.reversed.toList();
}

Future<Assignment> getAssignmentById(int id) async {
  final supabase = Supabase.instance.client;
  final Map assignmentJson =
      await supabase.from('assignment').select().eq("id", id).single();
  return Assignment.fromJson(assignmentJson);
}

Future<Assignment> insertAssignment(Map assigment) async {
  final supabase = Supabase.instance.client;
  final Map assignmentJson =
      await supabase.from('assignment').insert(assigment).select().single();

  return Assignment.fromJson(assignmentJson);
}
