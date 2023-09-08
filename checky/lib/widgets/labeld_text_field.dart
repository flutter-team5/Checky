import 'package:checky/constants/colors.dart';
import 'package:flutter/material.dart';

class TitledField extends StatelessWidget {
  const TitledField({
    super.key,
    required this.label,
    required this.hintText,
    this.icon,
    this.obscureText = false,
    this.labelColor = CColors.black,
    this.controller,
    this.fieldColor = const [
      Color.fromARGB(255, 209, 209, 209),
      Color.fromARGB(221, 232, 232, 232)
    ],
    this.fieldMaxLines = 1,
    this.fontSize = 17,
    this.labelWeight = FontWeight.w500,
  });

  final String label;
  final String hintText;
  final IconData? icon;
  final bool? obscureText;
  final Color? labelColor;
  final TextEditingController? controller;
  final List<Color>? fieldColor;
  final int? fieldMaxLines;
  final double? fontSize;
  final FontWeight? labelWeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize!,
            fontWeight: labelWeight,
            color: labelColor,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              colors: fieldColor!,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.45],
              tileMode: TileMode.clamp,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText!,
            maxLines: fieldMaxLines,
            expands: false,
            style: const TextStyle(fontSize: 20.0, color: Colors.black54),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12.0),
              prefixIcon: Icon(
                icon,
                color: Colors.black54,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontFamily: 'Rubik-VariableFont_wght',
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(32.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            onSubmitted: (value) {},
          ),
        ),
      ],
    );
  }
}
