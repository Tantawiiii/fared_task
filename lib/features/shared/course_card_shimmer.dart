import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/constants/colors.dart';

class CourseCardShimmer extends StatelessWidget {
  const CourseCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.blue[100]!,
      child: Container(
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
      ),
    );
  }
}
