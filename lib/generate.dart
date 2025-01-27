import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';



class Generate extends StatelessWidget {
  final AppRouter appRouter;
   Generate({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'El - Farid',
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashPage,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }

}
