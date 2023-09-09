import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/model/controllers_model.dart';
import 'package:checky/widgets/create_assg_widgets/cancel_dialog.dart';
import 'package:checky/widgets/create_assg_widgets/test_cases_fileds.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:checky/widgets/labeld_text_field.dart';
import 'package:flutter/material.dart';

List<TestCaseFields> casesFieldList = [const TestCaseFields()];
List<Controller> casesControllerList = [];

//TODO Scrolling issues

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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 80,
              left: 25,
              right: 25,
              bottom: 5,
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
          Expanded(
            child: Container(
              // color: Colors.amber,
              margin: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        CSpaces.kVspace16,
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(top: 2),
                            itemCount: casesFieldList.length,
                            itemBuilder: (context, index) {
                              return const TestCaseFields();
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
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
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: CColors.ligthRed,
        onPressed: () {
          if (casesFieldList.length < 3) {
            casesFieldList.add(const TestCaseFields());
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
