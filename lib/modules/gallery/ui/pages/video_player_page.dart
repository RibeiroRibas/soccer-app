import 'dart:io';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/modules/gallery/gallery_route_navigator.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final File video;

  const VideoPlayerPage({super.key, required this.video});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  final _navigator = Modular.get<GalleryRouteNavigator>();
  late FlickManager _flickManager;

  @override
  void initState() {
    super.initState();
    _flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.file(widget.video));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) {
        if (_flickManager.flickControlManager!.isFullscreen) {
          _flickManager.flickControlManager!.exitFullscreen();
        }
        _navigator.pop();
      },
      child: Scaffold(
        body: Center(
          child: AspectRatio(
              aspectRatio: 16 / 10,
              child: FlickVideoPlayer(flickManager: _flickManager)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _flickManager.dispose();
    super.dispose();
  }
}
