import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/routing/app_router.dart';
import 'package:math_app/mental_concept_app.dart';
import 'package:provider/provider.dart';
import 'package:math_app/features/game/logic/providers/game_provider.dart';
import 'package:math_app/features/stories/logic/providers/audio_player_provider.dart';
import 'package:math_app/features/stories/logic/providers/story_provider.dart';
import 'core/logic/provider/language_provider.dart';
import 'features/learn_counter/logic/provider/counter_provider.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GameProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AudioPlayerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LanguageProvider(),
        ),
      ],
      child: MentalConceptApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
