import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';
import 'package:provider/provider.dart';

import 'core/routing/app_router.dart';
import 'core/routing/routers.dart';

class MentalConceptApp extends StatelessWidget {
  const MentalConceptApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GameProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Mental Concept',
          theme: ThemeData(
            fontFamily: 'Noto',
            primaryColor: ColorsManager.mainBlue,
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
