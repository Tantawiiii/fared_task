import 'package:bounce/bounce.dart';
import 'package:fared_task/core/routing/routes.dart';
import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:fared_task/core/utils/constants/sizes.dart';
import 'package:fared_task/core/utils/constants/text_strings.dart';
import 'package:fared_task/core/utils/helpers/navigations.dart';
import 'package:fared_task/core/utils/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/theming/styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 400.h,
      end: 450.h,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_back.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: Bounce(
              onTap: () => context.pushNamed(Routes.loginPage),
              child: Text(
                TTexts.skip,
                style: TextStyle(
                  fontSize: TSizes.fontSizeSm,
                  fontWeight: FontWeight.bold,
                  color: TColors.white,
                ),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 133),
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/logo.svg',
                    width: 150.w,
                    height: 68.h,
                  ),
                  SizedBox(height: 20),
                  Text(TTexts.onBoardingTitle1,
                      style: TextStyles.font24WhiteBold,),
                  verticalSpace(4),
                  Text(
                    TTexts.onBoardingSubTitle1,
                    textAlign: TextAlign.center,
                    style: TextStyles.font14LightGreyRegular,
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Image.asset(
                      'assets/images/kid1.png',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitHeight,
                      height: _animation.value,
                    );
                  },
                ),

                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(0.8),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Bounce(
                    onTap: () => context.pushNamed(Routes.loginPage),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: TSizes.md),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          TTexts.tContinue,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: TSizes.fontSizeMd,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

