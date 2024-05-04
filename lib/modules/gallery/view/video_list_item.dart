import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/gallery/gallery_navigator_rotes.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoListItem extends StatelessWidget {
  final File video;

  const VideoListItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    final GalleryNavigatorRoutes navigator =
        Modular.get<GalleryNavigatorRoutes>();

    return FutureBuilder(
        future: initialize(context),
        builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
          return snapshot.data != null
              ? GestureDetector(
                  child: Stack(fit: StackFit.expand, children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor)),
                      child: Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Icon(Icons.play_arrow)
                  ]),
                  onTap: () => navigator.pushNamed(
                      '$galleryRoute$videoPlayerRoute', {"video": video}),
                )
              : const SizedBox();
        });
  }

  Future<Uint8List?> initialize(BuildContext context) async {
    return await VideoThumbnail.thumbnailData(
      video: video.path,
      imageFormat: ImageFormat.JPEG,
      quality: 25,
    );
  }
}
