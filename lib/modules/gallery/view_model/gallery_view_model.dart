import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:team_draw/services/media_service.dart';

part "gallery_view_model.g.dart";

class GalleryViewModel = GalleryViewModelBase with _$GalleryViewModel;

abstract class GalleryViewModelBase with Store {
  final MediaService mediaService;

  GalleryViewModelBase(this.mediaService);

  @observable
  int currentIndex = 0;

  @observable
  ObservableList<String> images = ObservableList<String>();

  @observable
  ObservableList<File> videos = ObservableList<File>();

  @observable
  bool isMediaLocationPermanentlyDenied = false;

  @observable
  bool isImage = true;

  @action
  void changeCurrentIndex(int index) {
    currentIndex = index;
    if (index == 0) {
      isImage = true;
    } else {
      isImage = false;
    }
  }

  @action
  Future<void> pickImagesFromDevice() async {
    final List<String>? imagesFromDevice =
        await mediaService.pickImagesFomDevice();
    if (imagesFromDevice != null) {
      final List<String> images = [];
      for (var image in imagesFromDevice) {
        images.add(image);
      }
      if (images.isNotEmpty) {
        this.images.addAll(images);
      }
    } else {
      if (await mediaService.isMediaLocationPermanentlyDenied()) {
        isMediaLocationPermanentlyDenied = !isMediaLocationPermanentlyDenied;
      }
    }
  }

  @action
  Future<void> pickVideosFromDevice() async {
    final File? videoFromDevice = await mediaService.pickVideoFromDevice();
    if (videoFromDevice != null) {
      videos.add(videoFromDevice);
    } else {
      if (await mediaService.isMediaLocationPermanentlyDenied()) {
        isMediaLocationPermanentlyDenied = !isMediaLocationPermanentlyDenied;
      }
    }
  }
}
