class Assignment {
  int? id;
  String? createdAt;
  String? assignmentTitle;
  String? assignmentDescription;
  int? userId;

  Assignment(
      {this.id,
      this.createdAt,
      this.assignmentTitle,
      this.assignmentDescription,
      this.userId});

  Assignment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    assignmentTitle = json['assignment_title '];
    assignmentDescription = json['assignment_description '];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['assignment_title '] = this.assignmentTitle;
    data['assignment_description '] = this.assignmentDescription;
    data['user_id'] = this.userId;
    return data;
  }
}
