import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/modules/gallery/controllers/gallery_controller.dart';
import 'package:team_draw/modules/gallery/gallery_route_navigator.dart';
import 'package:team_draw/modules/gallery/ui/list_item/image_list_item.dart';
import 'package:team_draw/modules/gallery/ui/list_item/video_list_item.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/app_bar_tittle_with_close_button_component.dart';
import 'package:team_draw/shared/ui/dialogs/permission_denied_dialog.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final _navigator = Modular.get<GalleryRouteNavigator>();
  final _controller = Modular.get<GalleryController>();
  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer =
        reaction((_) => _controller.isMediaLocationPermanentlyDenied, (_) {
      _showPermissionDeniedDialog();
    });
  }

  Future<void> _showPermissionDeniedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PermissionDeniedDialog(onCloseDialog: () => _navigator.pop());
      },
    );
  }

  Future<void> _goToVideoPlayerPage(File video) {
    return _navigator.pushNamed('$galleryRoute$videoPlayerRoute',
        arguments: {"video": video});
  }

  Future<void> _goToImageViewerPage(int index) {
    return _navigator.pushNamed('$galleryRoute$imageViewerRoute',
        arguments: {"images": _controller.images, "imageIndex": index});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTittleWithCloseButtonComponent(
        tittle: gallery,
        onCloseAction: () => _navigator.goTo(homeNavBarRoute),
      ),
      floatingActionButton: Builder(
        builder: (_) {
          return Observer(
            builder: (_) => _controller.currentIndex == 0
                ? FloatingActionButton(
                    onPressed: () => _controller.pickImagesFromDevice(),
                    child: const Icon(Icons.photo_library),
                  )
                : FloatingActionButton(
                    onPressed: () => _controller.pickVideosFromDevice(),
                    child: const Icon(Icons.video_library),
                  ),
          );
        },
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          child: _controller.isImage
              ? GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: _controller.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () => _goToImageViewerPage(index),
                        child: ImageListItem(image: _controller.images[index]));
                  },
                )
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: _controller.videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () =>
                          _goToVideoPlayerPage(_controller.videos[index]),
                      child: VideoListItem(
                        video: _controller.videos[index],
                      ),
                    );
                  },
                ),
        ),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: images,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: videos,
            ),
          ],
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: _controller.currentIndex,
          onTap: (index) => _controller.changeCurrentIndex(index),
        ),
      ),
    );
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }
}
