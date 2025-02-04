import 'dart:io';

import 'package:bounce/bounce.dart';
import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:fared_task/core/utils/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../cubit/session_bloc.dart';
import '../../cubit/session_state.dart';
import '../ui/all_sessions.dart';
import '../ui/details_schedule_screen.dart';

class CustomCalendarRow extends StatelessWidget {
  const CustomCalendarRow({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final weekDays = List.generate(7, (index) {
      final day = today.subtract(Duration(days: today.weekday - index +2));
      return {
        'day': _getArabicDayName(day),
        'date': DateFormat('d').format(day),
        'isSelected': day.day == today.day &&
            day.month == today.month &&
            day.year == today.year,
      };
    });

    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        if (state is SessionLoading) {

          return Center(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3,
                      (index) => Container(
                    width: 50,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is SessionError) {
          print(state.message);
          return Center();
        } else if (state is SessionLoaded) {
          final students = state.sessions.expand((s) => s.students).toList();
          print("sessions: ${state.sessions.length}");
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('MMMM yyyy', 'ar').format(today),
                      style: TextStyles.font20BlackExtraBold,
                    ),
                    Bounce(
                      onTap: (){
                        final selectedDate = DateFormat('d MMMM yyyy', 'ar').format(today);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllSessions(selectedDay: selectedDate),
                          ),
                        );
                      },
                      child: Text(
                        "عرض الكل",
                        style: TextStyles.font14BlackBold,
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                SizedBox(
                  height: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: weekDays.map((day) {
                        final isSelected = day['isSelected'] == true;
                        return GestureDetector(
                          onTap: () {
                            final selectedDate = DateFormat('d MMMM yyyy', 'ar').format(DateTime.now().subtract(Duration(days: today.weekday - weekDays.indexOf(day) + 2)));

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailedScheduleScreen(
                                  selectedDay: selectedDate,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: isSelected ? Colors.blue : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "${day['day']}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: isSelected ? Colors.white : Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${day['date']}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: isSelected ? Colors.white : Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelected)
                                Positioned(
                                  bottom: -8,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: students.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 4),
                                          child:CircleAvatar(
                                            radius: 12,
                                            backgroundImage: students[index].imageUrl.startsWith('http')
                                                ? NetworkImage(students[index].imageUrl)
                                                : FileImage(File(students[index].imageUrl)) as ImageProvider,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  String _getArabicDayName(DateTime date) {
    const daysInArabic = [
      'أحد',
      'إثنين',
      'ثلاثاء',
      'أربعاء',
      'خميس',
      'جمعة',
      'سبت',
    ];
    return daysInArabic[date.weekday % 7];
  }
}
