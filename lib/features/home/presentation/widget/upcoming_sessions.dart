import 'package:fared_task/features/home/presentation/widget/secssion_card_widget.dart';
import 'package:flutter/material.dart';


class UpcomingSessionsScreen extends StatefulWidget {
  const UpcomingSessionsScreen({super.key});

  @override
  _UpcomingSessionsScreenState createState() => _UpcomingSessionsScreenState();
}

class _UpcomingSessionsScreenState extends State<UpcomingSessionsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return SessionCard();
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_left, color: Colors.black),
              onPressed: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
            Row(
              children: List.generate(
                4,
                    (index) => AnimatedContainer(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  duration: Duration(milliseconds: 200),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.blue
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_right, color: Colors.black),
              onPressed: () {
                if (_currentPage < 3) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
