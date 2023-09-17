import 'package:checky/bloc/submissions_bloc/submissions_bloc.dart';
import 'package:checky/model/assignment_model.dart';
import 'package:checky/model/test_case_model.dart';
import 'package:checky/model/user_profile_model.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:checky/services/database/services/submission_services.dart';
import 'package:checky/services/database/services/test_cases_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';

const String apiEndpoint = "http://ec2-user@16.170.251.212:8080/api";

gradeSubmission(
    Assignment assignment, String fileLocation, BuildContext context) async {
  uploadFileToApi(fileLocation);

  List<TestCase>? testCases = await getAssignmentTestCases(assignment.id!);
  int marksAvailable = 0;
  int marksAquired = 0;
  for (var testCase in testCases!) {
    marksAvailable = marksAvailable + (testCase.markAssigned?.toInt() ?? 0);
    bool result = await sendTestCase(testCase, path.basename(fileLocation));
    print(result);
    if (result) {
      marksAquired = marksAquired + testCase.markAssigned!.toInt();
    }
  }

  Map submission = new Map();
  submission["marks_aquired"] = marksAquired;
  submission["marks_available"] = marksAvailable;
  submission["assignment_id"] = assignment.id;
  UserProfile userProfile = await getUserProfileByUserId(
      Supabase.instance.client.auth.currentUser!.id);
  submission["user_id"] = userProfile.id;

  insertSubmission(submission);

  context
      .read<SubmissionsBloc>()
      .add(GetAttemptsOnAssignmentEvent(assignment.id!));

}

uploadFileFromUser(Assignment assignment, BuildContext context) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    gradeSubmission(assignment, result.files.single.path!, context);
  } else {
    // User canceled the picker
  }
}

uploadFileToApi(String fileLocation) async {
  var request = http.MultipartRequest('POST', Uri.parse(apiEndpoint));
  var file = await http.MultipartFile.fromPath('file', fileLocation);

  request.files.add(file);

  try {
    var response = await request.send();
    if (response.statusCode == 200) {
      print('File uploaded successfully!');
    } else {
      print('File upload failed with status code ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading file: $e');
  }
}

Future<bool> sendTestCase(TestCase testcase, String fileName) async {
  final queryParameters =
      "?name=$fileName&testCaseInput=${testcase.input}&testCaseOutput=${testcase.expectedOutput}";
  var result = false;
  print(queryParameters);
  try {
    var response =
        await http.get(Uri.parse("$apiEndpoint/grade$queryParameters"));
    if (response.statusCode == 200) {
      print('Request successfully!');
      print(response.body);
      result = response.body.toLowerCase() == "true";
    } else {
      print('Request failed with status code ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending: $e');
  }
  return result;
}
