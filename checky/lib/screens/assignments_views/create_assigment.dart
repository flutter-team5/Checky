import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/model/controllers_model.dart';
import 'package:checky/widgets/create_assg_widgets/test_cases_fileds.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:flutter/material.dart';

List<TestCaseFields> casesFieldList = [const TestCaseFields()];
List<Controller> casesControllerList = [];

class CreateAssigment extends StatefulWidget {
  const CreateAssigment({super.key});

  @override
  State<CreateAssigment> createState() => _CreateAssigmentState();
}

class _CreateAssigmentState extends State<CreateAssigment> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // padding: const EdgeInsets.only(top: 60),
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
                    controller: titleController,
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
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 2),
                      itemCount: casesFieldList.length,
                      itemBuilder: (context, index) {
                        return const TestCaseFields();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.ligthRed,
        onPressed: () {
          if (casesFieldList.length < 3) {
            casesFieldList.add(const TestCaseFields());
          } else {
            const snackBar = SnackBar(
              content: Text('You reached the limit number of cases'),
              duration: Duration(milliseconds: 1900),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            ;
          }
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
