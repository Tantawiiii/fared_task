import 'package:fared_task/core/utils/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../widget/course_card.dart';
import '../widget/header_next_sessions.dart';

class DetailedScheduleScreen extends StatefulWidget {
  final String selectedDay;

  const DetailedScheduleScreen({super.key, required this.selectedDay});

  @override
  State<DetailedScheduleScreen> createState() => _DetailedScheduleScreenState();
}

class _DetailedScheduleScreenState extends State<DetailedScheduleScreen> {
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: TColors.headerBackground,
        body:  SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HeaderNextSessions(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
                decoration: BoxDecoration(
                  color: TColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(TSizes.fontSizeXl),
                    topRight: Radius.circular(TSizes.fontSizeXl),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.selectedDay,
                          style: TextStyles.font20BlackExtraBold,
                        ),
                        DropdownButton<String>(
                          value: 'يومي',
                          items: ['يومي', 'أسبوعي', 'شهرى']
                              .map((view) => DropdownMenuItem(
                            value: view,
                            child: Text(view),
                          ))
                              .toList(),
                          onChanged: (value) {},
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 68,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final today = DateTime.now();
                          final arabicWeekDays = ['الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت'];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(7, (index) {
                              final currentDay = today.add(Duration(days: index));
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        arabicWeekDays[currentDay.weekday % 7],
                                        style: TextStyles.font12WhiteBlack,
                                      ),
                                      SizedBox(height: 8),
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundColor: currentDay.day == today.day ? TColors.headerBackground : Colors.grey[200],
                                        child: Text(
                                          '${currentDay.day}',
                                          style: TextStyle(color: currentDay.day == today.day ? Colors.white : Colors.black),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(width: 4,),
                                  if (index < 6)
                                    Container(
                                      width: 1,
                                      height: double.infinity,
                                      color: Colors.grey[400],
                                    ),
                                ],
                              );
                            }),
                          );
                        },
                      ),
                    ),

                    Divider(),

                    Expanded(
                      child: ListView.builder(
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 144,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(' ${index + 1} PM', style:TextStyles.font12WhiteBlack),
                                ),
                                if (index == 1 || index == 3)
                                Positioned(
                                    left: 40,
                                    right: 8,
                                    top:  0,
                                    child: CourseCard(),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                  ],
                ),
              )   ,
            ],
          ),
        ),
      ),
    );
  }

}


