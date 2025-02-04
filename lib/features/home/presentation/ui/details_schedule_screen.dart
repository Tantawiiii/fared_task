import 'package:fared_task/features/shared/course_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/theming/styles.dart';
import '../../../shared/empty_sessions.dart';
import '../../cubit/session_bloc.dart';
import '../../cubit/session_state.dart';
import '../widget/course_card.dart';
import '../widget/header_next_sessions.dart';

class DetailedScheduleScreen extends StatefulWidget {
  final String selectedDay;

  const DetailedScheduleScreen({super.key, required this.selectedDay});

  @override
  State<DetailedScheduleScreen> createState() => _DetailedScheduleScreenState();
}

class _DetailedScheduleScreenState extends State<DetailedScheduleScreen> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate =
        intl.DateFormat('d MMMM yyyy', 'ar').parse(widget.selectedDay);
    context.read<SessionCubit>().fetchSessions();
  }

  @override
  Widget build(BuildContext context) {
    final arabicWeekDays = [
      'الأحد',
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت'
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: TColors.headerBackground,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const HeaderNextSessions(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                decoration: BoxDecoration(
                  color: TColors.white,
                  borderRadius: const BorderRadius.only(
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
                    const SizedBox(height: 16),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 68,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(7, (index) {
                            DateTime day = selectedDate.add(Duration(
                                days: index - selectedDate.weekday));
                            bool isSelected = day.day == selectedDate.day &&
                                day.month == selectedDate.month &&
                                day.year == selectedDate.year;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDate = day;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    arabicWeekDays[day.weekday % 7],
                                    style: TextStyles.font12WhiteBlack,
                                  ),
                                  const SizedBox(height: 8),
                                  CircleAvatar(
                                    radius: 16,
                                    backgroundColor: isSelected
                                        ? TColors.headerBackground
                                        : Colors.grey[200],
                                    child: Text(
                                      '${day.day}',
                                      style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      flex: 8,
                      child: Row(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: List.generate(24, (index) {
                                final hourLabel = intl.DateFormat('h a', 'ar')
                                    .format(DateTime(0, 0, 0, index));
                                return Container(
                                  width: 60,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: Text(
                                    hourLabel,
                                    style: TextStyles.font14BlackBold,
                                  ),
                                );
                              }),
                            ),
                          ),
                          const VerticalDivider(width: 1),
                          Expanded(
                            child: BlocBuilder<SessionCubit, SessionState>(
                              builder: (context, state) {
                                if (state is SessionLoading) {
                                  return CourseCardShimmer();
                                } else if (state is SessionLoaded) {
                                  String formattedSelectedDate = intl.DateFormat('yyyy-MM-dd').format(selectedDate);

                                  final filteredSessions = state.sessions.where((session) {
                                    String sessionDate = intl.DateFormat('yyyy-MM-dd').format(session.date);
                                    return sessionDate == formattedSelectedDate;
                                  }).toList();

                                  return filteredSessions.isNotEmpty
                                      ? ListView.builder(
                                    itemCount: filteredSessions.length,
                                    itemBuilder: (context, index) =>
                                        CourseCard(
                                            session:
                                            filteredSessions[index]),
                                  )
                                      : const EmptySessions();
                                } else {
                                  return const EmptySessions();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
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