import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/gallery/gallery_navigator_rotes.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final File video;

  const VideoPlayerWidget({super.key, required this.video});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late FlickManager flickManager;
  final GalleryNavigatorRoutes navigator =
      Modular.get<GalleryNavigatorRoutes>();

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.file(widget.video));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        if (flickManager.flickControlManager!.isFullscreen) {
          flickManager.flickControlManager!.exitFullscreen();
        }
        navigator.pop();
      },
      child: Scaffold(
        body: Center(
          child: AspectRatio(
              aspectRatio: 16 / 10,
              child: FlickVideoPlayer(flickManager: flickManager)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
}
