import 'package:bounce/bounce.dart';
import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:fared_task/features/home/data/model/session_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/theming/styles.dart';

class CourseCard extends StatelessWidget {
  final Session session;
  const CourseCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(6.0),
      height: 150,
      decoration: BoxDecoration(
        color: TColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/kid1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              horizontalSpace(12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:  Text(
                        "مكتملة",
                        style: TextStyles.font12GreenBold,
                      ),
                    ),
                    verticalSpace(2),
                     Text(
                      "أنت جزء من المجتمع",
                      style: TextStyles.font14BlackBold,
                    ),
                    verticalSpace(2),
                    Row(
                      children: [

                        Row(
                          children: [
                            Icon(Icons.access_time, size: 18, color: Colors.grey),
                            horizontalSpace(2),
                            Text(
                              "45 دقيقة",
                              style:TextStyles.font12gray,
                            ),
                          ],
                        ),
                        horizontalSpace(8),
                        Row(
                          children: [
                            Icon(Icons.calendar_month, size: 18, color: Colors.grey),
                            horizontalSpace(2),
                            Text(
                              "24 سبتمبر 2024",
                              style:TextStyles.font12gray,
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(2),
                    const Text(
                      "يتعلم طفلك العادات والمهارات التي تجعله مميزاً...",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: TColors.fillContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                  decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Text("4.0",style: TextStyles.font12WhiteBlack,),
                      SvgPicture.asset("assets/svgs/star_rate.svg")
                    ],
                  ),
                ),
                Row(
                  children: [
                    Bounce(
                      onTap: (){},
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                            decoration: BoxDecoration(
                              color: TColors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/svgs/eye.svg"),
                                horizontalSpace(4),
                                Text("عرض التفاصيل", style: TextStyles.font12WhiteBlack,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    horizontalSpace(9),
                    Bounce(
                      onTap: (){},
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
                            decoration: BoxDecoration(
                              color: TColors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset("assets/svgs/video-recorder.svg"),
                                horizontalSpace(4),
                                Text("شاهد", style: TextStyles.font12WhiteBlack,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
