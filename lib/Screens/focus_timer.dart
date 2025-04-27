import 'package:flutter/material.dart';
import 'package:focus_tracker/components/ui/time_selector.dart';
import 'package:is_lock_screen/is_lock_screen.dart';
import 'dart:async';

class FocusTimer extends StatefulWidget {
  const FocusTimer({super.key});

  @override
  State<FocusTimer> createState() => _FocusTimerState();
}

class _FocusTimerState extends State<FocusTimer> with WidgetsBindingObserver {
  double timeframe = 0;
  int _roundTimeFrame = 0;
  bool _hideSlider = false;
  bool _stopTimer = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    final isBackground = state == AppLifecycleState.paused;
    final isLocked = await isLockScreen();
    if (isLocked == null) return;

    // TODO: Figure out why locking of screen is not detected

    print(isLocked);

    if (isLocked) {
      print("THe Phone was locked");
    }

    if (isBackground && isLocked) {
      print("The Phone was locked");
    }

    if (isBackground && !isLocked) {
      print("The App runs in the Background");
    }
  }

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
