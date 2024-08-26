import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/styles.dart';
import '../../../game/logic/providers/game_provider.dart';

class SelectOperation extends StatelessWidget {
  const SelectOperation({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, value, child) {
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Operation :', style: TextStyles.font30BlackExtraBold),
              Row(
                children: [
                  PopupMenuButton<String>(
                    onSelected: (String result) {
                      Provider.of<GameProvider>(context, listen: false)
                          .setOperation(result);
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Add',
                        child: Text('Addition (+)'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Subtract',
                        child: Text('Subtraction (-)'),
                      ),
                    ],
                    child: Row(
                      children: [
                        Text(
                          value.operation.isEmpty
                              ? 'Select Operation'
                              : value.operation,
                          style: TextStyles.font14DarkBlueBold,
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
