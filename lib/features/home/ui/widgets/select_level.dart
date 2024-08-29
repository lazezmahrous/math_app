import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/styles.dart';
import '../../../game/logic/providers/game_provider.dart';

class SelectLevel extends StatelessWidget {
  const SelectLevel({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'level',
              style: TextStyles.font20BlackExtraBold,
            ),
            Row(
              children: [
                PopupMenuButton<String>(
                  onSelected: (String result) {
                    Provider.of<GameProvider>(context, listen: false)
                        .changeLevel(result);
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'levelOne',
                      child: Text('Level One (0 To 5)'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'levelTow',
                      child: Text('Level Tow (5 To 9)'),
                    ),
                  ],
                  child: Row(
                    children: [
                      Text(
                        value.level.isEmpty ? 'Change Level' : value.level,
                      ),
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
