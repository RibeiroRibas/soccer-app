import 'package:flutter/material.dart';

class SliderOverallWidget extends StatefulWidget {
  final double? initialValue;
  final void Function(double overall) onChanged;

  const SliderOverallWidget({
    Key? key,
    required this.onChanged, this.initialValue,
  }) : super(key: key);

  @override
  State<SliderOverallWidget> createState() => _SliderOverallWidgetState();
}

class _SliderOverallWidgetState extends State<SliderOverallWidget> {
  late double _currentSliderValue;
  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initialValue ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 5,
      divisions: 10,
      label: _currentSliderValue.toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
          widget.onChanged(value);
        });
      },
    );
  }
}
