

import 'package:flutter/material.dart';

class SessionCalenderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final String time;
  final String duration;
  final Color color;
  final List<String> participants;

  const SessionCalenderCard({super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.time,
    required this.duration,
    required this.color,
    this.participants = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (participants.isNotEmpty)
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                child: Text(
                  'ج',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$time • $duration', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text(status, style: TextStyle(fontSize: 12, color: color)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}