import 'package:fared_task/features/home/presentation/widget/subscribtion_card_widget.dart';
import 'package:flutter/material.dart';

class SubscriptionSection extends StatefulWidget {
  const SubscriptionSection({super.key});

  @override
  _SubscriptionSectionState createState() => _SubscriptionSectionState();
}

class _SubscriptionSectionState extends State<SubscriptionSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return SubscriptionCard();
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
                2,
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
                if (_currentPage < 1) {
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
