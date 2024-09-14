import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';
import '../../logic/provider/counter_provider.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  int _secondsRemaining = 0; // عد الثواني بدلاً من الدقائق
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  void _startCountDown() {
    final targetTime =
        Provider.of<CounterProvider>(context, listen: false).targetTime;
    print(targetTime);

    if (targetTime != null) {
      final now = DateTime.now();
      final difference = targetTime.difference(now);
      setState(() {
        _secondsRemaining = difference.inSeconds; // حساب الفرق بالثواني
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        // تغيير التحديث كل ثانية
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
          } else {
            _timer?.cancel();
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _secondsRemaining ~/ 60; // تحويل الثواني المتبقية إلى دقائق
    final seconds =
        _secondsRemaining % 60; // الحصول على الثواني المتبقية بعد تحويل الدقائق

    return _secondsRemaining > 0
        ? Text(
            " ${S.of(context).counter_timer_fenish} $minutes:${seconds.toString().padLeft(2, '0')} ${S.of(context).minut}")
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).time_fenish),
              TextButton(
                  onPressed: () async {
                    Provider.of<CounterProvider>(context, listen: false)
                        .checkAndResetScoresIfNeeded();
                  },
                  child: Text(S.of(context).refresh))
            ],
          );
  }
}
