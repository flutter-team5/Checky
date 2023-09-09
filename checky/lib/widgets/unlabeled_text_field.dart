import 'package:flutter/material.dart';

class UnlabaledField extends StatelessWidget {
  const UnlabaledField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.controller,
  });

  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 209, 209, 209),
            Color.fromARGB(221, 232, 232, 232)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.45],
          tileMode: TileMode.clamp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        expands: false,
        style: const TextStyle(fontSize: 20.0, color: Colors.black54),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
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
    );
  }
}
