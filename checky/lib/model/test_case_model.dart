class TestCase {
  int? id;
  String? input;
  String? expectedOutput;
  int? markAssigned;
  int? assignmentId;

  TestCase(
      {this.id,
      this.input,
      this.expectedOutput,
      this.markAssigned,
      this.assignmentId});

  TestCase.fromJson(Map json) {
    id = json['id'];
    input = json['input '];
    expectedOutput = json['expected_output'];
    markAssigned = json['mark_assigned'];
    assignmentId = json['assignment_id'];
  }

  Map toJson() {
    final Map data = new Map();
    data['input'] = this.input;
    data['expected_output'] = this.expectedOutput;
    data['mark_assigned'] = this.markAssigned;
    data['assignment_id'] = this.assignmentId;
    return data;
  }
}
