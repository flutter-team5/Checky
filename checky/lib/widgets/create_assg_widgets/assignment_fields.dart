import 'package:checky/constants/spacings.dart';
import 'package:checky/screens/assignments_views/create_assigment.dart';
import 'package:checky/widgets/create_assg_widgets/send_assignment_fields.dart';
import 'package:checky/widgets/create_assg_widgets/test_cases_fileds.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:flutter/material.dart';

class AssignmentFields extends StatelessWidget {
  const AssignmentFields({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitledField(
            controller: titleController,
            label: "Title",
            hintText: "Enter assignment title",
            fontSize: 18,
            labelWeight: FontWeight.bold,
          ),
          CSpaces.kVspace24,
          TitledField(
            controller: descriptionController,
            label: "Description",
            hintText: "Enter assignment description",
            fieldMaxLines: 10,
            fontSize: 18,
            labelWeight: FontWeight.bold,
          ),
          CSpaces.kVspace24,
          const Text(
            "Test Cases",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          CSpaces.kVspace16,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 2),
            itemCount: testCasesControllers.length,
            itemBuilder: (context, index) {
              return TestCaseFields(
                controllers: testCasesControllers[index],
              );
            },
          ),
          SendAssignmentFields(
            titleController: titleController,
            descriptionController: descriptionController,
          ),
        ],
      ),
    );
  }
}
