import 'package:mobx/mobx.dart';
import 'package:team_draw/modules/app/repository/local_storage_repository.dart';
import 'package:team_draw/services/media_service.dart';

part 'drawer_view_model.g.dart';

class DrawerViewModel = DrawerViewModelBase with _$DrawerViewModel;

abstract class DrawerViewModelBase with Store {
  final MediaService mediaService;
  final LocalStorageRepository repository;

  DrawerViewModelBase(this.mediaService, this.repository);

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
