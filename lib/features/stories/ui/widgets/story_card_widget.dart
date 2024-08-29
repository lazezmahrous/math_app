import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/services/play_sound.dart';
import 'package:math_app/features/stories/data/models/story_model.dart';

import '../../../../core/theming/styles.dart';

class StoryCardWidget extends StatefulWidget {
  StoryCardWidget({super.key, required this.colors, required this.story});
  List<Color>? colors;
  Story story;
  @override
  State<StoryCardWidget> createState() => _StoryCardWidgetState();
}

class _StoryCardWidgetState extends State<StoryCardWidget> {
  bool isPlaying = false;
  double progress = 0.0;

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });

    if (isPlaying) {
      PlaySound.play_sound(soundSource: 'sounds/${widget.story.soundName}');
    } else {
      PlaySound.stop_sound();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(39.r),
      child: Stack(
        children: [
          Container(
            width: 320.w,
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(39.r),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: widget.colors!,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                children: [
                  Positioned(
                    right: -20.w,
                    child: SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: Image.asset(
                        'assets/images/${widget.story.imageName}',
                      ),
                    ),
                  ),
                  Positioned(
                    right: 7.w,
                    top: 20.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const Icon(
                        Icons.play_lesson_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 25.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 100.w,
                          ),
                          child: Text(
                            widget.story.title,
                            style: TextStyles.font22WhiteExtraBold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
