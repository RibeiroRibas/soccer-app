import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/gallery/gallery_navigator_rotes.dart';
import 'package:team_draw/modules/gallery/view/gallery_view.dart';
import 'package:team_draw/modules/gallery/view/image_viewer_view.dart';
import 'package:team_draw/modules/gallery/view/video_player_widget.dart';
import 'package:team_draw/modules/gallery/view_model/gallery_view_model.dart';
import 'package:team_draw/services/media_service.dart';

class GalleryModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(MediaService.new);
    i.addSingleton(GalleryViewModel.new);
    i.addSingleton(ImagePicker.new);
    i.addLazySingleton(GalleryNavigatorRoutes.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const GalleryView(),
    );
    r.child(
      videoPlayerRoute,
      child: (context) => VideoPlayerWidget(video: r.args.data["video"]),
    );
    r.child(
      imageViewerRoute,
      child: (context) => ImageViewerView(
          images: r.args.data["images"], imageIndex: r.args.data["imageIndex"]),
    );
  }
}
