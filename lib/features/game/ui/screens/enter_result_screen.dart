import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/logic/provider/language_provider.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/routing/routers.dart';
import '../../../../core/services/convert_to_arabic_numbers.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class EnterResultScreen extends StatefulWidget {
  const EnterResultScreen({super.key, required this.result});
  final int result;

  @override
  State<EnterResultScreen> createState() => _EnterResultScreenState();
}

class _EnterResultScreenState extends State<EnterResultScreen> {
  List<int> levelOnerandomNumbers = [0, 1, 2, 3, 4, 5];
  List<int> levelTowrandomNumbers = [6, 7, 8, 9];

  @override
  void initState() {
    super.initState();

    // خلط الأرقام
    levelOnerandomNumbers.shuffle();
    levelTowrandomNumbers.shuffle();

    // إزالة النتيجة من القوائم قبل التعامل معها
    levelOnerandomNumbers.remove(widget.result);
    levelTowrandomNumbers.remove(widget.result);

    // أخذ أول 3 أرقام من كل قائمة
    levelOnerandomNumbers = levelOnerandomNumbers.take(3).toList();
    levelTowrandomNumbers = levelTowrandomNumbers.take(3).toList();

    // إضافة النتيجة إلى القوائم بعد أخذ 3 أرقام
    levelOnerandomNumbers.add(widget.result);
    levelTowrandomNumbers.add(widget.result);

    // خلط القوائم بعد إضافة النتيجة
    levelOnerandomNumbers.shuffle();
    levelTowrandomNumbers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    final gameProvider = Provider.of<GameProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).feature_enter_result_header,
                    style: TextStyles.font25BlueBold,
                  ),
                  verticalSpace(40),
                  SizedBox(
                    height: 500.h,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          if (levelOnerandomNumbers[index] == widget.result) {
                            context.pushReplacementNamed(Routes.successScreen);
                          } else {
                            context.pushReplacementNamed(Routes.failureScreen);
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  ColorsManager.secondBlueColor,
                                  ColorsManager.mainBlue,
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${languageProvider.currentLanguage == 'ar' ? ConvertToArabicNumbers.convertToArabicNumbers('${gameProvider.level == 'levelOne' ? levelOnerandomNumbers[index] : levelTowrandomNumbers[index]}') : gameProvider.level == 'levelOne' ? levelOnerandomNumbers[index] : levelTowrandomNumbers[index]}',
                                style: TextStyles.font22WhiteExtraBold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
