import 'package:mobx/mobx.dart';
import 'package:team_draw/shared/repositories/local_storage_repository.dart';
import 'package:team_draw/services/media_service.dart';

part 'drawer_menu_controller.g.dart';

class DrawerMenuController = DrawerControllerBase with _$DrawerMenuController;

abstract class DrawerControllerBase with Store {
  final MediaService mediaService;
  final LocalStorageRepository repository;

  DrawerControllerBase(this.mediaService, this.repository);

  final String _imageDrawer = "image_drawer";

  @observable
  String? image;

  @observable
  bool isMediaLocationPermanentlyDenied = false;

  Future<void> init() async {
    image = await repository.read(_imageDrawer);
  }

  Future<void> onImageTap() async {
    if (await mediaService.isMediaLocationPermanentlyDenied()) {
      isMediaLocationPermanentlyDenied = !isMediaLocationPermanentlyDenied;
    } else {
      String? selectedImage = await mediaService.pickImageFomDevice();
      if (selectedImage != null) {
        await repository.write(_imageDrawer, selectedImage);
        image = selectedImage;
      }
    }
  }
}
