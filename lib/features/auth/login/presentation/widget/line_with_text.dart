import 'package:fared_task/core/utils/theming/styles.dart';
import 'package:flutter/material.dart';

class LineTextLine extends StatelessWidget {
  const LineTextLine({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey.shade300,
            thickness: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "أو",
            style: TextStyles.font14Light2GreyRegular,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey.shade300,
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
