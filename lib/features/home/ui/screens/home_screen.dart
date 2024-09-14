// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/extensions.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/routing/routers.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/core/theming/styles.dart';
import 'package:math_app/core/widgets/app_card_section.dart';
import '../../../../generated/l10n.dart';
import '../../../game/logic/providers/game_provider.dart';
import '../widgets/show_score.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void exitApp() {
    SystemNavigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        exitApp();
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                expandedHeight: 260.h,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30.r),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  S.of(context).home_title,
                                  style: TextStyles.font25BlueBold,
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.pushNamed(Routes.settingsScreen);
                                  },
                                  icon: const Icon(Icons.settings),
                                ),
                              ],
                            ),
                            verticalSpace(20),
                            ShowScore(
                              height: 130.h,
                              colors: [
                                ColorsManager.moreDarkBlue,
                                ColorsManager.secondBlueColor,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Column(
                        children: [
                          AppCardSection(
                            routeName: Routes.learnCounter,
                            sectionName:
                                S.of(context).home_feature_learn_on_counter,
                            colors: [
                              ColorsManager.purple,
                              ColorsManager.lightPurple,
                            ],
                            imageName: 'counter.png',
                          ),
                          verticalSpace(20),
                          AppCardSection(
                            routeName: Routes.startTest,
                            sectionName: S.of(context).home_feature_start_test,
                            colors: [
                              ColorsManager.green,
                              ColorsManager.lightGreen,
                            ],
                            imageName: 'math_element.png',
                          ),
                          verticalSpace(20),
                          AppCardSection(
                            routeName: Routes.stories,
                            sectionName: S.of(context).home_feature_stories,
                            colors: [
                              ColorsManager.yellow,
                              ColorsManager.lighYellow,
                            ],
                            imageName: 'boy_book.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
