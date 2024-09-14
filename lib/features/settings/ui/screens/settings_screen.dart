import 'package:flutter/material.dart';
import 'package:math_app/core/widgets/app_appbar.dart';
import 'package:provider/provider.dart';

import '../../../../core/logic/provider/language_provider.dart';
import '../../../../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).feature_set_language),
                    PopupMenuButton<String>(
                      onSelected: (String value) {
                        Provider.of<LanguageProvider>(context, listen: false)
                            .changeLanguage(value);
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem<String>(
                            value: 'ar',
                            child: Text('العربية'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'en',
                            child: Text('English'),
                          ),
                        ];
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
