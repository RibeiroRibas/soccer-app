import 'dart:convert';

import 'package:flutter/material.dart';

class ImageListItem extends StatelessWidget {
  final String image;

  const ImageListItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Image.memory(
        base64Decode(image),
        fit: BoxFit.cover,
      ),
    );
  }
}
