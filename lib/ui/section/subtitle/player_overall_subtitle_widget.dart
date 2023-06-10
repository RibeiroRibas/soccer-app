import 'package:flutter/material.dart';

class PlayerOverallSubtitleWidget extends StatelessWidget {
  final String text;
  final Color color;

  const PlayerOverallSubtitleWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
