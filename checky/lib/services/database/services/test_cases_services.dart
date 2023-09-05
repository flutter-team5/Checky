import 'package:checky/model/test_case_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<TestCase>?> getTestCases() async {
  final supabase = Supabase.instance.client;
  final List testCasesJson = await supabase.from('test_case').select();
  final List<TestCase> testCases = [];
  for (final testCaseJson in testCasesJson) {
    testCases.add(TestCase.fromJson(testCaseJson));
  }
  return testCases;
}

Future<TestCase> getTestCaseById(int id) async {
  final supabase = Supabase.instance.client;
  final Map testCaseJson =
      await supabase.from('test_case').select().eq("id", id).single();
  return TestCase.fromJson(testCaseJson);
}

Future<List<TestCase>?> getAssignmentTestCases(int assignmentId) async {
  final supabase = Supabase.instance.client;
  final List testCasesJson = await supabase.from('test_case').select().eq("assignment_id", assignmentId);
  final List<TestCase> testCases = [];
  for (final testCaseJson in testCasesJson) {
    testCases.add(TestCase.fromJson(testCaseJson));
  }
  return testCases;
}
