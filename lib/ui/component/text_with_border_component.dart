import 'package:flutter/material.dart';

import '../../shared/theme/green_theme.dart';

class TextWithBorderComponent extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const TextWithBorderComponent({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: textStyle!.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 0.5
              ..color = greenTheme.primaryColor,
          ),
          softWrap: true,
        ),
        Text(
          text,
          style: textStyle,
          softWrap: true,
        )
      ],
    );
  }
}
