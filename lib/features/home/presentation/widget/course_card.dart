import 'package:bounce/bounce.dart';
import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:fared_task/features/home/data/model/session_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/theming/styles.dart';
import '../../../getMeeting/cubit/meeting_recording_bloc.dart';
import '../../../getMeeting/cubit/meeting_recording_state.dart';
import '../../../getMeeting/presentation/web_view_record.dart';

class CourseCard extends StatelessWidget {
  final Session session;
  const CourseCard({super.key, required this.session});

  String _getAppointmentStatusText(int status) {
    switch (status) {
      case 1:
        return "معلق";
      case 2:
        return "مكتملة";
      case 3:
        return "قيد الإنتظار";
      case 4:
        return "فاتتك";
      default:
        return "غير معروف";
    }
  }

  void _handleRecording(BuildContext context) {
    if (session.appointmentStatus == 2) {
      final cubit = context.read<MeetingRecordingCubit>();
      cubit.fetchMeetingRecording(session.id);

      cubit.stream.listen((state) {
        if (state is MeetingRecordingLoaded) {
          final url = state.recording.result?.recordings?.first.playbacks?.first.url;
          if (url != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewScreen(url: url),
              ),
            );
          } else {
            _showSnackBar(context, "No recording URL available");
          }
        } else if (state is MeetingRecordingError) {
          _showSnackBar(context, "فشل تحميل التسجيل");
        }
      });
    } else {
      _showSnackBar(context, "لا يمكنك مشاهدة التسجيل الآن");
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

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
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/kid1.jpg",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _getAppointmentStatusText(session.appointmentStatus),
                          style: TextStyles.font12GreenBold,
                        ),
                      ),
                      verticalSpace(2),
                      Text(session.title, style: TextStyles.font14BlackBold),
                      verticalSpace(2),
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 18, color: Colors.grey),
                          horizontalSpace(2),
                          Text("${session.date.hour} ساعه", style: TextStyles.font12gray),
                          horizontalSpace(8),
                          Icon(Icons.calendar_month, size: 18, color: Colors.grey),
                          horizontalSpace(2),
                          Text(DateFormat('d MMMM yyyy').format(session.date), style: TextStyles.font12gray),
                        ],
                      ),
                      verticalSpace(2),
                      Text(session.shortDescription, style: TextStyles.font12gray, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(color: TColors.fillContainer),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildRatingWidget(),
                _buildActionButtons(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
      decoration: BoxDecoration(
        color: TColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text("4.0", style: TextStyles.font12WhiteBlack),
          SvgPicture.asset("assets/svgs/star_rate.svg"),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Bounce(
          onTap: () {},
          child: _buildButton("عرض التفاصيل", "assets/svgs/eye.svg"),
        ),
        horizontalSpace(9),
        Bounce(
          onTap: () => _handleRecording(context),
          child: _buildButton("شاهد", "assets/svgs/video-recorder.svg"),
        ),
      ],
    );
  }

  Widget _buildButton(String text, String iconPath) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2),
      decoration: BoxDecoration(
        color: TColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          horizontalSpace(4),
          Text(text, style: TextStyles.font12WhiteBlack),
        ],
      ),
    );
  }
}
