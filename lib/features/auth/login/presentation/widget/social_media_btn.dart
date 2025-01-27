import 'package:bounce/bounce.dart';
import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:fared_task/core/utils/theming/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/constants/sizes.dart';

class SocialMediaBtn extends StatelessWidget {
  final String iconPath;
  final String text;
  final VoidCallback onTap;

  const SocialMediaBtn({
    required this.iconPath,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56.h,
        padding: EdgeInsets.symmetric(horizontal: TSizes.md),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: TColors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24.0,
              height: 24.0,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style:TextStyles.font14BlackMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
