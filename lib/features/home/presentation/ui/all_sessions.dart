import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/theming/styles.dart';
import '../widget/course_card.dart';
import '../widget/header_next_sessions.dart';

class AllSessions extends StatefulWidget {
  const AllSessions({super.key, required this.selectedDay});
  final String selectedDay;

  @override
  State<AllSessions> createState() => _AllSessionsState();
}

class _AllSessionsState extends State<AllSessions> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: TColors.headerBackground,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HeaderNextSessions(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
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
                    verticalSpace(8),
                    TableCalendar(
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      onFormatChanged: (format) {
                        setState(() {
                          _calendarFormat = format;
                        });
                      },
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: TColors.primary,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: TColors.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    verticalSpace(8),
                    CourseCard(),
                    verticalSpace(8),
                    CourseCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
