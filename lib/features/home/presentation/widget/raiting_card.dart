import 'package:bounce/bounce.dart';
import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/theming/styles.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/kid2.jpg'),
              ),
              const SizedBox(width: 8),
              const Text(
                'قاسم زياد',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
            width: double.infinity,
            height: 2,
            color: TColors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'التفكير خارج الصندوق',
                style: TextStyles.font14BlackMedium,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('assets/images/kid2.jpg'),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'المدرب | محمد زياد طارق',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/clock.svg",
                    width: 20,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '22 أغسطس 2024',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Bounce(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                  decoration: BoxDecoration(
                    color: TColors.fillContainerRating,
                    border: Border.all(color: TColors.secondary),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/svgs/empty_star.svg"),
                      horizontalSpace(4),
                      Text("تقييم الورشة", style: TextStyles.font12BlackMedium,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
