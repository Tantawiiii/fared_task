import 'package:fared_task/core/local_data/user_id_local.dart';
import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:fared_task/core/utils/constants/sizes.dart';
import 'package:fared_task/features/auth/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/local_data/shared_preferance.dart';
import '../../core/utils/helpers/spacing.dart';
import '../home/presentation/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final token = await getAccessToken();
    final ParentId = await getParentId();

    print("Checking token: Done");
    print("Checking ParentId: $ParentId");
    Future.delayed(Duration(seconds: 3), () {
      if (token != null && token.isNotEmpty) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 600),
            pageBuilder: (_, __, ___) => HomeScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      } else {

        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 600),
            pageBuilder: (_, __, ___) => OnboardingScreen(),
            transitionsBuilder: (_, animation, __, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_img.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svgs/logo.svg',
                    width: 150.w,
                    height: 68.h,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LoadingAnimationWidget.staggeredDotsWave(
                      color: TColors.loading_splash,
                      size: 24.sp,
                    ),
                    verticalSpace(16),
                    Text(
                      'Beta V0.1',
                      style: TextStyle(
                        fontSize: TSizes.fontSizeMd,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
