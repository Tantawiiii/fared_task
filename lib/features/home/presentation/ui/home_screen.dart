import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:fared_task/core/utils/constants/sizes.dart';
import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:fared_task/features/home/presentation/ui/report_section.dart';
import 'package:fared_task/features/home/presentation/widget/custom_calender_row.dart';
import 'package:fared_task/features/home/presentation/widget/header_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../core/local_data/shared_preferance.dart';
import '../../../../core/utils/theming/styles.dart';
import '../widget/my_children_widget.dart';
import '../widget/subscribtion_section.dart';
import '../widget/upcoming_sessions.dart';

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
        title: TTexts.tCalender,
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


    void _onTabSelected(int index) async {
      if (index == 4) {
        await clearAccessToken();
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        setState(() {
          visit = index;
        });
      }
    }


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: TColors.headerBackground,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HeaderWidget(),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: TColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(TSizes.fontSizeXl),
                    topRight: Radius.circular(TSizes.fontSizeXl),
                  ),
                ),
                child: Column(
                  children: [
                    CustomCalendarRow(),
                    Container(
                      height: 155,
                      color: TColors.fillBackgroundSessionsSection,
                      child: Center(child: MyChildrenWidget()),
                    ),
                    Container(
                      height: 8,
                      color: TColors.white,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      color: TColors.fillBackgroundSessionsSection,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "الجلسات القادمة ",
                                    style: TextStyles.font18BlackBold,
                                  ),
                                  horizontalSpace(2),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 1),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text("04"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "المزيد",
                                    style: TextStyles.font16BlackBold,
                                  ),
                                  horizontalSpace(2),
                                  Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    color: TColors.darkGrey,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          verticalSpace(10),
                          UpcomingSessionsScreen(),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      color: TColors.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "الاشتراكات",
                                    style: TextStyles.font18BlackBold,
                                  ),
                                  horizontalSpace(2),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 1),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text("01"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "ادارة الاشتراكات",
                                    style: TextStyles.font16BlackBold,
                                  ),
                                  horizontalSpace(2),
                                  Icon(
                                    Icons.keyboard_arrow_left_outlined,
                                    color: TColors.darkGrey,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          verticalSpace(14),
                          SubscriptionSection(),

                        ],
                      ),
                    ),
                    verticalSpace(14),
                    Container(
                      color: TColors.fillBackgroundSessionsSection,
                        child: ReportsSection(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBarFloating(
          items: items,
          backgroundColor: TColors.white,
          color: TColors.light2Grey,
          colorSelected: TColors.iconSelect,
          indexSelected: visit,
          paddingVertical: 24,
          onTap:_onTabSelected,
        ),
      ),
    );
  }
}
