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

  void updateTimeFrame(double newTime) {
    setState(() {
      timeframe = newTime;
      _roundTimeFrame = newTime.round();
    });
  }

  void updatedTime() {
    const duration = Duration(seconds: 1);
    Timer.periodic(duration, (Timer t) {
      if (_roundTimeFrame == 0) t.cancel();

      setState(() {
        _roundTimeFrame -= 1;
      });
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
            TimeSelector(
              timeframe: timeframe,
              updateTimeFrame: updateTimeFrame,
            ),

            TextButton(onPressed: updatedTime, child: Text("Start")),
          ],
        ),
      ),
    );
  }
}
