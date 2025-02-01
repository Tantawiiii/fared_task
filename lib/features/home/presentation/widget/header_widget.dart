import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/constants/text_strings.dart';
import '../../../../core/utils/helpers/spacing.dart';
import '../../../../core/utils/theming/styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

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
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/profile_img.png"),

                  ),
                  horizontalSpace(5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(TTexts.tWelcomeBack, style: TextStyles.font12WhiteRegular,),
                      Text("أحمد طنطاوى", style: TextStyles.font18WhiteExtraBold,),
                    ],
                  ),
                ],
              ),
              SvgPicture.asset("assets/svgs/notification.svg", width: 44,height: 44,fit: BoxFit.cover,)
            ],
          ),
        ),
      ],
    );
  }
}
