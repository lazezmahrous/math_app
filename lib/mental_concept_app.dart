import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/logic/provider/language_provider.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routers.dart';
import 'generated/l10n.dart';

class MentalConceptApp extends StatefulWidget {
  const MentalConceptApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<MentalConceptApp> createState() => _MentalConceptAppState();
}

class _MentalConceptAppState extends State<MentalConceptApp> {
  bool? _isUserOpenApp; // استخدم متغير عادي بدلاً من Future

  @override
  void initState() {
    super.initState();

    _checkUserOpenApp(); // استدعاء الدالة للتحقق من حالة التطبيق
  }

  Future<void> _checkUserOpenApp() async {
    final prefs = await SharedPreferences.getInstance();
    final isOpen = prefs.getBool('openApp') ?? false;
    setState(() {
      _isUserOpenApp = isOpen; // تحديث الـ UI بناءً على النتيجة
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isUserOpenApp == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return Consumer<LanguageProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              theme: ThemeData(
                fontFamily: 'Cairo',
                primaryColor: ColorsManager.mainBlue,
              ),
              locale: value.language,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              initialRoute:
                  _isUserOpenApp! ? Routes.homeScreen : Routes.onBoardingScreen,
              onGenerateRoute: widget.appRouter.generateRoute,
            );
          },
        );
      },
    );
  }
}
