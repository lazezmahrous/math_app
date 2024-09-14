import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_app/core/theming/colors.dart';
import 'package:math_app/core/widgets/app_appbar.dart';
import 'package:math_app/features/stories/logic/providers/story_provider.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../../../../core/widgets/app_back_button.dart';
import '../../../../core/widgets/app_play_video_widget.dart';
import '../../../../generated/l10n.dart';
import '../../logic/providers/audio_player_provider.dart';

class PlayAndReadingStory extends StatefulWidget {
  const PlayAndReadingStory({super.key});

  @override
  State<PlayAndReadingStory> createState() => _PlayAndReadingStoryState();
}

class _PlayAndReadingStoryState extends State<PlayAndReadingStory> {
  // bool _isConnected = false;
  // List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  late AudioPlayerProvider _audioPlayerProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _audioPlayerProvider =
        Provider.of<AudioPlayerProvider>(context, listen: false);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   initConnectivity();
  //   _connectivitySubscription =
  //       _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  // }

  // @override
  // void dispose() {
  //   _connectivitySubscription.cancel();
  //   _audioPlayerProvider.stop(); // Use the saved reference here
  //   super.dispose();
  // }

  // Future<void> initConnectivity() async {
  //   late List<ConnectivityResult> result;
  //   try {
  //     result = await _connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     print('Couldn\'t check connectivity status ${e.code}');
  //     return;
  //   }
  //   if (!mounted) {
  //     return;
  //   }

  //   _updateConnectionStatus(result);
  // }

  // void _updateConnectionStatus(List<ConnectivityResult> result) {
  //   setState(() {
  //     _connectionStatus = result;
  //     _isConnected = result.first != ConnectivityResult.none ? true : false;
  //   });
  //   print('Connectivity changed: $_connectionStatus');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppAppbar(),
        body: SingleChildScrollView(
          child: Consumer2<StoryProvider, AudioPlayerProvider>(
            builder: (context, storyProvider, audioProvider, child) {
              return Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 300.w,
                              maxHeight: 600.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  ColorsManager.secondBlueColor,
                                  ColorsManager.mainBlue,
                                ],
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Stack(
                                children: [
                                  if (audioProvider.isAudioPlaying)
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: SizedBox(
                                        height: 20.h,
                                        child: WaveWidget(
                                          config: CustomConfig(
                                            gradients: [
                                              [
                                                Colors.white,
                                                ColorsManager.darkBlue
                                              ],
                                              [Colors.blueAccent, Colors.white],
                                            ],
                                            durations: [35000, 19440],
                                            heightPercentages: [0.20, 0.23],
                                            blur: const MaskFilter.blur(
                                                BlurStyle.solid, 10),
                                            gradientBegin: Alignment.bottomLeft,
                                            gradientEnd: Alignment.topRight,
                                          ),
                                          waveAmplitude: 0,
                                          size: Size(double.infinity, 50.h),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 15.h),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        storyProvider.story.description,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        children: [
                          Slider(
                            value: audioProvider.position.inSeconds.toDouble(),
                            max: audioProvider.duration.inSeconds.toDouble(),
                            onChanged: (value) {
                              audioProvider
                                  .seekTo(Duration(seconds: value.toInt()));
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.replay_10),
                                onPressed: audioProvider.rewind,
                              ),
                              IconButton(
                                icon: Icon(audioProvider.isAudioPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow),
                                onPressed: () {
                                  if (audioProvider.isAudioPlaying) {
                                    audioProvider.pause();
                                  } else {
                                    audioProvider.play(
                                        'sounds/${storyProvider.story.soundName}');
                                  }
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.forward_10),
                                onPressed: audioProvider.fastForward,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
