import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:team_draw/modules/home/routes/home_navigator_routes.dart';
import 'package:team_draw/modules/home/view/gallery/image_list_item.dart';
import 'package:team_draw/modules/home/view/gallery/video_list_item.dart';
import 'package:team_draw/modules/home/view_model/gallery_view_model.dart';
import 'package:team_draw/services/media_service.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/app_bar_tittle_with_close_button_component.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  final HomeNavigatorRoutes navigator = Modular.get<HomeNavigatorRoutes>();
  final GalleryViewModel viewModel = Modular.get<GalleryViewModel>();

  @override
  void initState() {
    super.initState();
    reaction((_) => viewModel.isMediaLocationPermanentlyDenied, (_) {
      _showMyDialog();
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text(accessMediaLocationDenied),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(thePermissionShouldBeGranted),
                Text(setPermissionGrantedToAccessMediaLocation),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await openAppSettings();
                navigator.pop();
              },
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.onBackground)),
              child: const Text(grantPermission),
            ),
            TextButton(
              onPressed: () {
                navigator.pop();
              },
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.onBackground)),
              child: const Text(notPermission),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTittleWithCloseButtonComponent(
        tittle: "Galeria",
        onCloseAction: () => navigator.pop(),
      ),
      floatingActionButton: Builder(
        builder: (_) {
          return Observer(
            builder: (_) => viewModel.currentIndex == 0
                ? FloatingActionButton(
                    onPressed: () => viewModel.pickImagesFromDevice(),
                    child: const Icon(Icons.photo_library),
                  )
                : FloatingActionButton(
                    onPressed: () => viewModel.pickVideosFromDevice(),
                    child: const Icon(Icons.video_library),
                  ),
          );
        },
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          child: viewModel.isImage
              ? GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: viewModel.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ImageListItem(image: viewModel.images[index]);
                  },
                )
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: viewModel.videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return VideoListItem(
                      video: viewModel.videos[index],
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
              label: "Imagens",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: "Vídeos",
            ),
          ],
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: viewModel.currentIndex,
          onTap: (index) => viewModel.changeCurrentIndex(index),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Modular.dispose<GalleryViewModel>();
    Modular.dispose<MediaService>();
    super.dispose();
  }
}
