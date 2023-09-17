import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/model/controllers_model.dart';
import 'package:checky/widgets/create_assg_widgets/assignment_fields.dart';
import 'package:flutter/material.dart';

List<Controllers> testCasesControllers = [];

class CreateAssigment extends StatefulWidget {
  const CreateAssigment({super.key});

  @override
  State<CreateAssigment> createState() => CreateAssigmentState();
}

class CreateAssigmentState extends State<CreateAssigment> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    for (var controllers in testCasesControllers) {
      controllers.input.dispose();
      controllers.output.dispose();
      controllers.mark.dispose();
    }
    testCasesControllers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 80,
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/logo_inside.png",
                    width: 35,
                  ),
                  CSpaces.kHspace8,
                  const Text(
                    "Create new assigment",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CSpaces.kVspace32,
            Expanded(
              child: AssignmentFields(titleController: titleController, descriptionController: descriptionController),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.ligthRed,
        onPressed: () {
          if (testCasesControllers.length < 3) {
            testCasesControllers.add(Controllers());
          } else {
            const caseLimitSnackBar = SnackBar(
              content: Text('You reached the limit number of cases'),
              duration: Duration(milliseconds: 1900),
            );
            ScaffoldMessenger.of(context).showSnackBar(caseLimitSnackBar);
          }
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

