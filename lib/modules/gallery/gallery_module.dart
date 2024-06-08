import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/modules/gallery/controllers/gallery_controller.dart';
import 'package:team_draw/modules/gallery/gallery_route_navigator.dart';
import 'package:team_draw/modules/gallery/ui/pages/gallery_page.dart';
import 'package:team_draw/modules/gallery/ui/pages/image_viewer_page.dart';
import 'package:team_draw/modules/gallery/ui/pages/video_player_page.dart';
import 'package:team_draw/services/media_service.dart';

class GalleryModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(MediaService.new);
    i.addSingleton(GalleryController.new);
    i.addSingleton(ImagePicker.new);
    i.addLazySingleton(GalleryRouteNavigator.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const GalleryPage(),
    );
    r.child(
      videoPlayerRoute,
      child: (context) => VideoPlayerPage(video: r.args.data["video"]),
    );
    r.child(
      imageViewerRoute,
      child: (context) => ImageViewerView(
          images: r.args.data["images"], imageIndex: r.args.data["imageIndex"]),
    );
  }
}
