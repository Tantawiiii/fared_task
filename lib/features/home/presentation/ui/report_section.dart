import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../widget/report_card.dart';

class ReportsSection extends StatelessWidget {
  const ReportsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children:  [
                        Text(
                          "التقارير",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: TColors.black,
                          ),
                        ),
                        Divider(
                            color: Colors.grey,
                          thickness: 2,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {},
                    child:  Column(
                      children: [
                        Text(
                          "الواجبات",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        SizedBox(
          height: 320,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                child: SizedBox(
                  width: 220,
                  child: ReportCard(
                    title: "ورشة لأطفال التوحد للتفكير خارج الصندوق",
                    date: "22 أغسطس 2024",
                    imagePath: "assets/images/kid1.jpg",
                  ),
                ),
              );
            },
          ),
        ),


      ],
    );
  }
}