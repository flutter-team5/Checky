class Assignment {
  int? id;
  String? assignmentTitle;
  String? assignmentDescription;
  int? userId;

  Assignment(
      {this.id, this.assignmentTitle, this.assignmentDescription, this.userId});

  Assignment.fromJson(Map json) {
    id = json['id'];
    assignmentTitle = json['assignment_title'];
    assignmentDescription = json['assignment_description'];
    userId = json['user_id'];
  }

  Map toJson() {
    final Map data = new Map();
    data['assignment_title '] = this.assignmentTitle;
    data['assignment_description '] = this.assignmentDescription;
    data['user_id'] = this.userId;
    return data;
  }
}
