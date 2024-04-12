import 'package:flutter/material.dart';

class TextWithBorderComponent extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const TextWithBorderComponent({
    super.key,
    required this.text,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 0.5
              ..color = Theme.of(context).primaryColor,
          ),
          softWrap: true,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle,
          softWrap: true,
        )
      ],
    );
  }
}
