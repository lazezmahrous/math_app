import 'package:flutter/material.dart';
import 'package:math_app/core/routing/app_router.dart';
import 'package:math_app/mental_concept_app.dart';
import 'package:provider/provider.dart';

import 'features/game/logic/providers/game_provider.dart';

void main() {
  runApp( MentalConceptApp(
      appRouter: AppRouter(),
    ),
  );
}
