import 'package:checky/constants/spacings.dart';
import 'package:checky/widgets/unlabeled_text_field.dart';
import 'package:flutter/material.dart';

class TestCaseFields extends StatelessWidget {
  const TestCaseFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
