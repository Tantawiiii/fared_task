import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/theming/styles.dart';

class MyChildrenWidget extends StatelessWidget {
  const MyChildrenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "أطفالي (3)",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "عرض الكل",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),

            ],
          ),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 36,
                  backgroundColor: TColors.circleBackground,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: TColors.white,),
                      Text(
                        "أضف",
                        textAlign: TextAlign.center,
                        style: TextStyles.font14WhiteBold
                      ),
                    ],
                  ),
                ),
              ),
              _buildChildAvatar('assets/images/kid1.jpg',),
              _buildChildAvatar('assets/images/kid2.jpg', ),
              _buildChildAvatar('assets/images/kid1.png', ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build child avatars
  Widget _buildChildAvatar(String imagePath,) {
    return CircleAvatar(
      radius: 36,
      child: CircleAvatar(
        radius: 34,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
