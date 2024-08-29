import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/helpers/spacing.dart';
import 'package:math_app/core/routing/routers.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/core/theming/styles.dart';
import 'package:math_app/core/widgets/app_card_section.dart';
import '../widgets/show_score.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 230.h,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Back 👋',
                            style: TextStyles.font25BlueBold,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Column(
                      children: [
                        AppCardSection(
                          routeName: Routes.stories,
                          sectionName: 'Stories',
                          colors: [
                            ColorsManager.yellow,
                            ColorsManager.lighYellow,
                          ],
                          imageName: 'boy_book.png',
                        ),
                        verticalSpace(20),
                        AppCardSection(
                          routeName: Routes.startTest,
                          sectionName: 'Start Test',
                          colors: [
                            ColorsManager.green,
                            ColorsManager.lightGreen,
                          ],
                          imageName: 'math_element.png',
                        ),
                        verticalSpace(20),
                        AppCardSection(
                          routeName: Routes.learnCounter,
                          sectionName: 'Learn Counter',
                          colors: [
                            ColorsManager.purple,
                            ColorsManager.lightPurple,
                          ],
                          imageName: 'counter.png',
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
    );
  }
}
