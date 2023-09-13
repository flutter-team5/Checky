import 'package:checky/bloc/assignments_bloc/assignments_bloc.dart';
import 'package:checky/constants/colors.dart';
import 'package:checky/extentions/extention.dart';
import 'package:checky/model/assignment_model.dart';
import 'package:checky/model/controllers_model.dart';
import 'package:checky/model/user_profile_model.dart';
import 'package:checky/screens/assignments_views/create_assigment.dart';
import 'package:checky/services/database/services/assignments_services.dart';
import 'package:checky/services/database/services/profile_service.dart';
import 'package:checky/services/database/services/test_cases_services.dart';
import 'package:checky/widgets/create_assg_widgets/cancel_dialog.dart';
import 'package:checky/widgets/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SendAssignmentFields extends StatelessWidget {
  const SendAssignmentFields({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            // ignore: use_build_context_synchronously
            context
                .read<AssignmentsBloc>()
                .add(GetAssignmentsEvent());
            // ignore: use_build_context_synchronously
            context.pop();
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
    );
  }
}
