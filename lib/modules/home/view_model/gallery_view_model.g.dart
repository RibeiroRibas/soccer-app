// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GalleryViewModel on GalleryViewModelBase, Store {
  late final _$currentIndexAtom =
      Atom(name: 'GalleryViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$imagesAtom =
      Atom(name: 'GalleryViewModelBase.images', context: context);

  @override
  ObservableList<String> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(ObservableList<String> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  late final _$videosAtom =
      Atom(name: 'GalleryViewModelBase.videos', context: context);

  @override
  ObservableList<File> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(ObservableList<File> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  late final _$isMediaLocationPermanentlyDeniedAtom = Atom(
      name: 'GalleryViewModelBase.isMediaLocationPermanentlyDenied',
      context: context);

  @override
  bool get isMediaLocationPermanentlyDenied {
    _$isMediaLocationPermanentlyDeniedAtom.reportRead();
    return super.isMediaLocationPermanentlyDenied;
  }

  @override
  set isMediaLocationPermanentlyDenied(bool value) {
    _$isMediaLocationPermanentlyDeniedAtom
        .reportWrite(value, super.isMediaLocationPermanentlyDenied, () {
      super.isMediaLocationPermanentlyDenied = value;
    });
  }

  late final _$isImageAtom =
      Atom(name: 'GalleryViewModelBase.isImage', context: context);

  @override
  bool get isImage {
    _$isImageAtom.reportRead();
    return super.isImage;
  }

  @override
  set isImage(bool value) {
    _$isImageAtom.reportWrite(value, super.isImage, () {
      super.isImage = value;
    });
  }

  late final _$pickImagesFromDeviceAsyncAction = AsyncAction(
      'GalleryViewModelBase.pickImagesFromDevice',
      context: context);

  @override
  Future<void> pickImagesFromDevice() {
    return _$pickImagesFromDeviceAsyncAction
        .run(() => super.pickImagesFromDevice());
  }

  late final _$pickVideosFromDeviceAsyncAction = AsyncAction(
      'GalleryViewModelBase.pickVideosFromDevice',
      context: context);

  @override
  Future<void> pickVideosFromDevice() {
    return _$pickVideosFromDeviceAsyncAction
        .run(() => super.pickVideosFromDevice());
  }

  late final _$GalleryViewModelBaseActionController =
      ActionController(name: 'GalleryViewModelBase', context: context);

  @override
  void changeCurrentIndex(int index) {
    final _$actionInfo = _$GalleryViewModelBaseActionController.startAction(
        name: 'GalleryViewModelBase.changeCurrentIndex');
    try {
      return super.changeCurrentIndex(index);
    } finally {
      _$GalleryViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
images: ${images},
videos: ${videos},
isMediaLocationPermanentlyDenied: ${isMediaLocationPermanentlyDenied},
isImage: ${isImage}
    ''';
  }
}
