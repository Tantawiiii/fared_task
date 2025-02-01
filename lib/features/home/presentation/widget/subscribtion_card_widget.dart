
import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscribtionCard extends StatelessWidget {
  const SubscribtionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(
                      'assets/images/kid1.jpg',
                    ),
                  ),
                  horizontalSpace(10),
                  Text(
                    'قاسم زياد',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset("assets/svgs/plans_icon.svg"),
                  horizontalSpace(4),
                  Text(
                    'باقة الانطلاقة',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  horizontalSpace(4),
                  SvgPicture.asset("assets/svgs/dots-vertical.svg"),
                ],
              ),
            ],
          ),
          verticalSpace(18),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/layer.svg",
                    width: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '10 ورشات',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              horizontalSpace(8),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/svgs/clock.svg",
                    width: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'ينتهي الاشتراك بتاريخ 22 أغسطس',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}

