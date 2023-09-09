import 'package:checky/constants/colors.dart';
import 'package:checky/constants/spacings.dart';
import 'package:checky/screens/assignments_views/create_assigment.dart';
import 'package:checky/widgets/unlabeled_text_field.dart';
import 'package:flutter/material.dart';

class TestCaseFields extends StatefulWidget {
  const TestCaseFields({
    super.key,
  });

  @override
  State<TestCaseFields> createState() => _TestCaseFieldsState();
}

class _TestCaseFieldsState extends State<TestCaseFields> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          casesFieldList.length > 1
              ? InkWell(
                  onTap: () {
                    casesFieldList.removeLast();
                    setState(() {});
                    context
                        .findAncestorStateOfType<CreateAssigmentState>()
                        ?.setState(() {});
                  },
                  child: const Icon(
                    Icons.remove_circle,
                    color: CColors.ligthRed,
                  ),
                )
              : const SizedBox(
                  width: 25,
                ),
          const Expanded(
            child: UnlabaledField(
              hintText: "Input",
            ),
          ),
          CSpaces.kHspace8,
          const Expanded(
            child: UnlabaledField(
              hintText: "Output",
            ),
          ),
          CSpaces.kHspace8,
          const Expanded(
            child: UnlabaledField(
              hintText: "Mark",
            ),
          ),
        ],
      ),
    );
  }
}
