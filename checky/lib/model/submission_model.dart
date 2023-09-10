import 'package:intl/intl.dart';

class Submission {
  int? id;
  DateTime? submissionTime;
  int? marksAquired;
  int? marksAvailable;
  int? assignmentId;
  int? userId;

  Submission(
      {this.id,
      this.submissionTime,
      this.marksAquired,
      this.marksAvailable,
      this.assignmentId,
      this.userId});

  Submission.fromJson(Map json) {
    id = json['id'];
    submissionTime = DateTime.parse(json['submission_time']);
    marksAquired = json['marks_aquired'];
    marksAvailable = json['marks_available'];
    assignmentId = json['assignment_id'];
    userId = json['user_id'];
  }

  Map toJson() {
    final Map data = new Map();
    data['marks_aquired '] = this.marksAquired;
    data['marks_available'] = this.marksAvailable;
    data['assignment_id'] = this.assignmentId;
    data['user_id'] = this.userId;
    return data;
  }

  String getSubmissionTimeFormatted() {
  final formatter = DateFormat('dd MMM yyyy');
  return formatter.format(submissionTime!);
}
}
