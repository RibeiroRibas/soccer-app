import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class StarRatingWidget extends StatefulWidget {
  final void Function(int index) onChanged;

  const StarRatingWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            setState(() {
              value = index + 1;
              widget.onChanged(value == index + 1 ? index : index + 1);
            });
          },
          color: index < value ? greenTheme.primaryColor : null,
          iconSize: 36.0,
          icon: Icon(
            index < value ? Icons.star : Icons.star_border,
          ),
          padding: EdgeInsets.zero,
        );
      }),
    );
  }
}
