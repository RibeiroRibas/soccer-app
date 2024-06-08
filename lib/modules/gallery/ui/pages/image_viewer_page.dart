import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageViewerView extends StatelessWidget {
  final List<String> images;
  final int imageIndex;
  const ImageViewerView(
      {super.key, required this.images, required this.imageIndex});

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders() {
      return images
          .map((image) => Image(
                image: MemoryImage(base64Decode(image)),
              ))
          .toList();
    }

    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.7,
        autoPlay: false,
        aspectRatio: 2.0,
        initialPage: imageIndex,
        enlargeCenterPage: true,
      ),
      items: imageSliders(),
    );
  }
}
