import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/helpers/spacing.dart';
import '../../../../core/utils/theming/styles.dart';

class HeaderNextSessions extends StatelessWidget {
  const HeaderNextSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: SvgPicture.asset(
            "assets/svgs/home_circle.svg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 64,
          right: 18,
          left: 18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Bounce(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    "assets/svgs/arrow_back.svg",
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover,
                  ),),
              Text(
                "الجلسات القادمة",
                style: TextStyles.font18WhiteExtraBold,
              ),
              SvgPicture.asset(
                "assets/svgs/setting.svg",
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ],
    );
  }
}
