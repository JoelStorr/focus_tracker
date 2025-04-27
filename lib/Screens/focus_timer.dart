import 'package:flutter/material.dart';
import 'package:focus_tracker/components/ui/time_selector.dart';
import 'dart:async';

class FocusTimer extends StatefulWidget {
  const FocusTimer({super.key});

  @override
  State<FocusTimer> createState() => _FocusTimerState();
}

class _FocusTimerState extends State<FocusTimer> {
  double timeframe = 0;
  int _roundTimeFrame = 0;
  bool _hideSlider = false;
  bool _stopTimer = false;

  void updateTimeFrame(double newTime) {
    setState(() {
      timeframe = newTime;
      _roundTimeFrame = newTime.round();
    });
  }

  void updatedTime() {
    const duration = Duration(seconds: 1);

    setState(() {
      _hideSlider = true;
    });

    Timer.periodic(duration, (Timer t) {
      if (_roundTimeFrame == 1 || _stopTimer) {
        t.cancel();
        setState(() {
          _hideSlider = false;
          _stopTimer = false;
        });
      }

      setState(() {
        _roundTimeFrame -= 1;
      });
    });
  }

  void stopTimer() {
    setState(() {
      _stopTimer = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen Two")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("$_roundTimeFrame"),
            if (!_hideSlider)
              TimeSelector(
                timeframe: timeframe,
                updateTimeFrame: updateTimeFrame,
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(onPressed: updatedTime, child: Text("Start")),
                TextButton(onPressed: stopTimer, child: Text("Stop")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
