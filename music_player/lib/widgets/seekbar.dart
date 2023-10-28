import 'package:flutter/material.dart';

class SeekBarData {
  final Duration position;
  final Duration duration;

  SeekBarData(this.position, this.duration);
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangedEnd;

  const SeekBar({
    Key? key,
    required this.position,
    required this.duration,
    this.onChanged,
    this.onChangedEnd,
  }) : super(key: key);

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(),
          child: Slider(
            value: 0,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
