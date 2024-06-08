import 'package:flutter/material.dart';

class SliderOverallComponent extends StatefulWidget {
  final double? initialValue;
  final void Function(double) onChangeEnd;

  const SliderOverallComponent({
    super.key,
    required this.onChangeEnd,
    this.initialValue,
  });

  @override
  State<SliderOverallComponent> createState() => _SliderOverallComponentState();
}

class _SliderOverallComponentState extends State<SliderOverallComponent> {
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
      max: 10,
      divisions: 10,
      label: _currentSliderValue.toString(),
      onChanged: (double value) => setState(
        () => _currentSliderValue = value,
      ),
      onChangeEnd: (double value) => widget.onChangeEnd(value),
    );
  }
}
