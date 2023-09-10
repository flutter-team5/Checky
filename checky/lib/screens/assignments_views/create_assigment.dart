import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/model/assignment_model.dart';
import 'package:checky/model/controllers_model.dart';
import 'package:checky/model/user_profile_model.dart';
import 'package:checky/services/database/services/assignments_services.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:checky/services/database/services/test_cases_services.dart';
import 'package:checky/widgets/create_assg_widgets/cancel_dialog.dart';
import 'package:checky/widgets/create_assg_widgets/test_cases_fileds.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
              child: SingleChildScrollView(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            Map assignmentMap = new Map();
                            assignmentMap["assignment_title"] =
                                titleController.text;
                            assignmentMap["assignment_description"] =
                                descriptionController.text;
                            UserProfile userProfile =
                                await getUserProfileByUserId(Supabase
                                    .instance.client.auth.currentUser!.id);
                            assignmentMap["user_id"] = userProfile.id;
                            Assignment assignment =
                                await insertAssignment(assignmentMap);
                            for (Controllers testCasesController
                                in testCasesControllers) {
                              Map testCase = new Map();
                              testCase["input"] =
                                  testCasesController.input.text;
                              testCase["expected_output"] =
                                  testCasesController.output.text;
                              testCase["mark_assigned"] =
                                  int.parse(testCasesController.mark.text);
                              testCase["assignment_id"] = assignment.id;
                              insertTestCase(testCase);
                            }
                          },
                          child: const CustomButton(
                            title: "Create",
                            fontSize: 16,
                            margBottom: 0,
                            margRight: 10,
                            hPadding: 5,
                            width: 0.29,
                            height: 37,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            cancelDialog(context);
                          },
                          child: const CustomButton(
                            title: "Cancel",
                            fontSize: 16,
                            margBottom: 0,
                            margRight: 10,
                            hPadding: 5,
                            width: 0.29,
                            height: 37,
                            buttonColor: CColors.ligthRed,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
