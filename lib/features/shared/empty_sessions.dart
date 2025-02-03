import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:fared_task/core/utils/theming/styles.dart';
import 'package:flutter/material.dart';

class EmptySessions extends StatelessWidget {
  const EmptySessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        verticalSpace(40),
        Image.asset("assets/images/empty.png", height: 220,),
        Text("لا يوجد دروس اليوم.", style: TextStyles.font16BlackBold,)
      ],
    );
  }
}
