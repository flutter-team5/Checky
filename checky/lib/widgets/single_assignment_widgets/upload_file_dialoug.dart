import 'package:checky/constants/colors.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return const SizedBox();
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        content: SizedBox(
          height: 130,
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Upload your file",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    width: 80,
                    height: 28,
                    decoration: BoxDecoration(
                      color: CColors.ligthRed,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "Upload",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'ADLaMDisplay',
                        fontSize: 15,
                        color: CColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
