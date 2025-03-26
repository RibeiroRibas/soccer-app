import 'package:flutter/material.dart';

class ShowEmptyPositionsComponent extends StatelessWidget {
  final bool showEmptyPositions;
  final VoidCallback onButtonPressed;

  const ShowEmptyPositionsComponent(
      {super.key,
      required this.showEmptyPositions,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return showEmptyPositions
        ? IconButton(
            icon: Icon(
              Icons.panorama_fish_eye,
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
            onPressed: onButtonPressed)
        : IconButton(
            icon: Icon(
              Icons.hide_source,
              color: Theme.of(context).primaryColor,
              size: 50,
            ),
            onPressed: onButtonPressed);
  }
}
