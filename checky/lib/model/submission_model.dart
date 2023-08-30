class Submission {
  int? id;
  String? createdAt;
  String? submissionTime;
  int? marksAquired;
  int? marksAvailable;
  int? assignmentId;
  int? userId;

  Submission(
      {this.id,
      this.createdAt,
      this.submissionTime,
      this.marksAquired,
      this.marksAvailable,
      this.assignmentId,
      this.userId});

  Submission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    submissionTime = json['submission_time '];
    marksAquired = json['marks_aquired '];
    marksAvailable = json['marks_available'];
    assignmentId = json['assignment_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['submission_time '] = this.submissionTime;
    data['marks_aquired '] = this.marksAquired;
    data['marks_available'] = this.marksAvailable;
    data['assignment_id'] = this.assignmentId;
    data['user_id'] = this.userId;
    return data;
  }
}
