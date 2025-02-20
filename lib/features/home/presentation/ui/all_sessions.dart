import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/theming/styles.dart';
import '../../../shared/course_card_shimmer.dart';
import '../../../shared/empty_sessions.dart';
import '../../cubit/session_bloc.dart';
import '../../cubit/session_state.dart';
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
  void initState() {
    // TODO: implement initState
    context.read<SessionCubit>().fetchSessions();
    super.initState();
  }
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
                      calendarBuilders: CalendarBuilders(
                        markerBuilder: (context, date, events) {
                          return BlocBuilder<SessionCubit, SessionState>(
                            builder: (context, state) {
                              if (state is SessionLoaded) {
                                final sessionsCount = state.sessions.where((session) {
                                  final sessionDate = DateTime(
                                    session.date.year,
                                    session.date.month,
                                    session.date.day,
                                  );
                                  return isSameDay(sessionDate, date);
                                }).length;

                                if (sessionsCount > 0) {
                                  return Positioned(
                                    bottom: 4,
                                    right: 4,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        '$sessionsCount',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              }
                              return SizedBox();
                            },
                          );
                        },
                      ),
                    ),

                    verticalSpace(8),
                    BlocBuilder<SessionCubit, SessionState>(
                      builder: (context, state) {
                        if (state is SessionLoading) {
                          return CourseCardShimmer();
                        } else if (state is SessionError) {
                          return Center(child: Text("Error loading sessions"));
                        } else if (state is SessionLoaded) {
                          final selectedDate = _selectedDay != null
                              ? "${_selectedDay!.year}-${_selectedDay!.month.toString().padLeft(2, '0')}-${_selectedDay!.day.toString().padLeft(2, '0')}"
                              : null;

                          final filteredSessions = state.sessions.where((session) {
                            final sessionDate = "${session.date.year}-${session.date.month.toString().padLeft(2, '0')}-${session.date.day.toString().padLeft(2, '0')}";
                            return selectedDate != null && sessionDate == selectedDate;
                          }).toList();



                          if (filteredSessions.isEmpty) {
                            return Center(child: EmptySessions());
                          } else {
                            return Expanded(
                              child: ListView.builder(
                                itemCount: filteredSessions.length,
                                itemBuilder: (context, index) {
                                  final session = filteredSessions[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: CourseCard(session: session),
                                  );
                                },
                              ),
                            );
                          }
                        }
                        return SizedBox();
                      },
                    ),
                    verticalSpace(18),
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
