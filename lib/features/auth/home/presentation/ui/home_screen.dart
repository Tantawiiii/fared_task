

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/text_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int visit = 0;
     List<TabItem> items = [
      TabItem(
        icon: Icons.home,
        title: TTexts.tHome,
      ),
      TabItem(
        icon: Icons.search_sharp,
        title:TTexts.tCalender,
      ),
      TabItem(
        icon: Icons.favorite_border,
        title: TTexts.tReports,
      ),
      TabItem(
        icon: Icons.shopping_cart_outlined,
        title: TTexts.tSupscription,
      ),
      TabItem(
        icon: Icons.settings_outlined,
        title: TTexts.tSetting,
      ),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text("Calender"),
        ),
        bottomNavigationBar: BottomBarFloating(
          items: items,
          backgroundColor: TColors.white,
          color: TColors.light2Grey,
          colorSelected: TColors.iconSelect,
          indexSelected: visit,
          paddingVertical: 24,
          onTap: (int index) => setState(() {
            visit = index;
          }),
        ),
      ),
    );
  }
}
