import 'package:flutter/material.dart';

class TapToOpenFabWidget extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onTapButton;

  const TapToOpenFabWidget(
      {Key? key, required this.isOpen, required this.onTapButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isOpen,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          isOpen ? 0.7 : 1.0,
          isOpen ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: isOpen ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: SizedBox(
            width: 56,
            height: 56,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: onTapButton,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
