import 'package:flutter/material.dart';
import 'package:math_app/features/stories/data/models/story_model.dart';

class StoryProvider with ChangeNotifier {
  Story? _story;
  Story get story => _story!;

  getStory(Story story) {
    _story = story;
    notifyListeners();
  }
}
