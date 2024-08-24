import 'package:mobx/mobx.dart';
import 'package:team_draw/shared/repositories/local_storage_repository.dart';
import 'package:team_draw/shared/services/local_storage_service.dart';
import 'package:team_draw/shared/services/media_service.dart';

part 'drawer_menu_controller.g.dart';

class DrawerMenuController = DrawerControllerBase with _$DrawerMenuController;

abstract class DrawerControllerBase with Store {
  final MediaService _mediaService;
  final LocalStorageService _localStorageService;

  DrawerControllerBase(this._mediaService, this._localStorageService);

  final String _imageDrawer = "image_drawer";

  @observable
  String? image;

  @observable
  bool isMediaLocationPermanentlyDenied = false;

  Future<void> init() async {
    image = await _localStorageService.read(_imageDrawer);
  }

  Future<void> onImageTap() async {
    if (await _mediaService.isMediaLocationPermanentlyDenied()) {
      isMediaLocationPermanentlyDenied = !isMediaLocationPermanentlyDenied;
    } else {
      String? selectedImage = await _mediaService.pickImageFomDevice();
      if (selectedImage != null) {
        await _localStorageService.write(_imageDrawer, selectedImage);
        image = selectedImage;
      }
    }
  }
}
