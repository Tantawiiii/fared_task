import 'package:bounce/bounce.dart';
import 'package:fared_task/core/utils/constants/colors.dart';
import 'package:fared_task/core/utils/constants/sizes.dart';
import 'package:fared_task/features/auth/login/presentation/widget/social_media_btn.dart';
import 'package:fared_task/features/auth/login/presentation/widget/texts_row.dart';
import 'package:fared_task/features/calender/calender_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../core/utils/constants/text_strings.dart';
import '../../../../../core/utils/helpers/spacing.dart';
import '../../../../../core/utils/theming/styles.dart';
import '../../providers/login_provider.dart';
import '../widget/line_with_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: TColors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: TSizes.lg, vertical: TSizes.xl),
            child: Consumer<LoginProvider>(
              builder: (context, provider, child) {
                return ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_rounded),
                        Text(
                          TTexts.loginAsGuest,
                          style: TextStyles.font14BlueRegular,
                        ),
                      ],
                    ),
                    verticalSpace(TSizes.lg),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/logo_black.svg',
                          width: 150.w,
                          height: 68.h,
                        ),
                        verticalSpace(4),
                        Text(
                          TTexts.loginTitle,
                          style: TextStyles.font18BlackBold,
                        ),
                        verticalSpace(4),
                      ],
                    ),
                    verticalSpace(TSizes.xl),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: TColors.iconColors,
                        ),
                        filled: true,
                        fillColor: TColors.headerBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: TTexts.loginEmail,
                        errorText: provider.emailError,
                        hintStyle: TextStyle(
                          color: TColors.iconColors,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 12.0),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    verticalSpace(TSizes.md),
                    TextField(
                      controller: _passwordController,
                      obscureText: _isObscured,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: TColors.iconColors,
                        ),
                        filled: true,
                        fillColor: TColors.headerBackground,
                        errorText: provider.passwordError,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                        hintText: TTexts.loginPassword,
                        hintStyle: TextStyle(
                          color: TColors.iconColors,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: TColors.iconColors,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    verticalSpace(TSizes.sm),

                    Text(
                      TTexts.loginForgetPassword,
                      style: TextStyles.font16BlackBold,
                    ),
                    verticalSpace(TSizes.xl),

                    provider.isLoading
                        ?     LoadingAnimationWidget.staggeredDotsWave(
                      color: TColors.loading_splash,
                      size: 24.sp,
                    )
                        : Bounce(
                      onTap:() async {
                        // Validation for empty fields
                        if (_emailController.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "البريد الإلكتروني مطلوب.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return;
                        }

                        if (_passwordController.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "كلمة المرور مطلوبة.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                          return;
                        }

                        final success = await provider.login(
                          _emailController.text,
                          _passwordController.text,
                        );
                        if (success) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CalenderScreen()),
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: provider.generalError ?? "Login failed. Please try again.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16),
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
                            TTexts.login,
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
                    verticalSpace(TSizes.lg),
                    LineTextLine(),
                    verticalSpace(TSizes.lg),
                    SocialMediaBtn(iconPath: "assets/icons/apple.svg", text: TTexts.loginWithApple, onTap: (){}),
                    verticalSpace(TSizes.smX),
                    SocialMediaBtn(iconPath: "assets/icons/google.svg", text:  TTexts.loginWithGoogle, onTap: (){}),
                    verticalSpace(TSizes.smX),
                    DualTextRow(),
                    verticalSpace(TSizes.smX),
                    Text(TTexts.tLoginLicince,
                    style: TextStyles.font14Light2GreyRegular,
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
