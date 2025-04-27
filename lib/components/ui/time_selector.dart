import 'package:flutter/material.dart';

class TimeSelector extends StatelessWidget {
  const TimeSelector({
    super.key,
    required this.timeframe,
    required this.updateTimeFrame,
  });

  final double timeframe;
  final void Function(double) updateTimeFrame;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Slider(
          value: timeframe,
          onChanged: updateTimeFrame,
          max: 240,
          divisions: 240,
        ),
      ],
    );
  }
}
