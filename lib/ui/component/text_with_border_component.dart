import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class TextWithBorderComponent extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

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
