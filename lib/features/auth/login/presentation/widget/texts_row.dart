import 'package:fared_task/core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class DualTextRow extends StatelessWidget {
  const DualTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          TTexts.tLoginNoHaveAcc,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(
          TTexts.tLoginNewAcc,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
