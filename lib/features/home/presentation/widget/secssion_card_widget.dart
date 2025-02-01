
import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:fared_task/core/utils/theming/styles.dart';
import 'package:flutter/material.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                Expanded(
                  child: Text(
                    'قاسم زياد',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            verticalSpace(12),
            InfoRow(label: 'عدد الورش المتبقية', value: '10'),
            verticalSpace(6),
            InfoRow(label: 'تاريخ الانتهاء', value: '22 أغسطس 2025'),
            verticalSpace(6),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: TColors.borderSessionInfo)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex:2 ,
                    child: Text(
                      "واجبات",
                      style: TextStyles.font14BlackBold,
                    ),
                  ),
                  Container(color: Colors.grey, height: 20, width: 2,),
                  horizontalSpace(8),
                  Expanded(
                    flex:3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: TColors.fillBackgroundRow,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: TColors.borderSessionInfo)
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red),
                          const SizedBox(width: 4),
                          Text(
                            "لديك واجبات متأخرة",
                            style: TextStyles.font12WhiteBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: TColors.borderSessionInfo)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person, color: TColors.black),
                      const SizedBox(width: 4),
                      Text(
                        "الملف الشخصي",
                        style: TextStyles.font12WhiteBlack,
                      ),
                    ],
                  ),
                ),
                horizontalSpace(8),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: TColors.borderSessionInfo)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_month, color: TColors.black),
                      const SizedBox(width: 4),
                      Text(
                        "الجدول كامل",
                        style: TextStyles.font12WhiteBlack,
                      ),
                    ],
                  ),
                ),
                horizontalSpace(8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
          border: Border.all(color: TColors.borderSessionInfo)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex:2 ,
            child: Text(
              label,
              style: TextStyles.font14BlackBold,
            ),
          ),
          Container(color: Colors.grey, height: 20, width: 2,),
          horizontalSpace(8),
          Expanded(
            flex:3,
            child: Text(
              value,
              style: TextStyles.font12WhiteBlack,
            ),
          ),
        ],
      ),
    );
  }
}
