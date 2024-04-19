import 'package:flutter/material.dart';

class PlayerInfoDetailWidget extends StatelessWidget {
  final String description;
  final String value;

  const PlayerInfoDetailWidget(
      {super.key, required this.description, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(description),
        Text(
          value,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ],
    );
  }
}
