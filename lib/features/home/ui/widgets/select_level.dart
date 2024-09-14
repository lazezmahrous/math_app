import 'package:flutter/material.dart';
import 'package:math_app/core/logic/provider/language_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../game/logic/providers/game_provider.dart';

class SelectLevel extends StatelessWidget {
  const SelectLevel({super.key});
  @override
  Widget build(BuildContext context) {
    String languageCode =
        Provider.of<LanguageProvider>(context).currentLanguage;
    return Consumer<GameProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).feature_start_test_select_level,
              style: TextStyles.font20BlackExtraBold,
            ),
            Row(
              children: [
                PopupMenuButton<String>(
                  onSelected: (String result) {
                    Provider.of<GameProvider>(context, listen: false)
                        .changeLevel(result);
                    print(result);
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'levelOne',
                      child: Text(
                          S.of(context).feature_start_test_select_level_one),
                    ),
                    PopupMenuItem<String>(
                      value: 'levelTow',
                      child: Text(
                          S.of(context).feature_start_test_select_level_tow),
                    ),
                  ],
                  child: Row(
                    children: [
                      Text(value.level == "levelOne"
                          ? languageCode == 'ar'
                              ? S
                                  .of(context)
                                  .feature_start_test_select_level_one
                              : value.level
                          : languageCode == 'ar'
                              ? S
                                  .of(context)
                                  .feature_start_test_select_level_tow
                              : value.level),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
