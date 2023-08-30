import 'package:checky/constants/colors.dart';
import 'package:flutter/material.dart';

class TitledField extends StatelessWidget {
  const TitledField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.labelColor = CColors.black,
    this.filled = false,
    this.fillColor = Colors.transparent,
    required this.controller,
  });

  final String label;
  final String hintText;
  final IconData icon;
  final bool? obscureText;
  final Color? labelColor;
  final bool? filled;
  final Color? fillColor;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: labelColor,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText!,
          decoration: InputDecoration(
            filled: filled,
            fillColor: fillColor,
            prefixIcon: Icon(icon),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.grey,
                //CColors.ligthRed,
              ),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
