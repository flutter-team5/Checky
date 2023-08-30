class TestCase {
  int? id;
  String? createdAt;
  String? input;
  String? expectedOutput;
  int? markAssigned;
  int? assignmentId;

  TestCase(
      {this.id,
      this.createdAt,
      this.input,
      this.expectedOutput,
      this.markAssigned,
      this.assignmentId});

  TestCase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    input = json['input '];
    expectedOutput = json['expected_output'];
    markAssigned = json['mark_assigned'];
    assignmentId = json['assignment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['input '] = this.input;
    data['expected_output'] = this.expectedOutput;
    data['mark_assigned'] = this.markAssigned;
    data['assignment_id'] = this.assignmentId;
    return data;
  }
}
