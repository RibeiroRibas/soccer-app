import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_draw/modules/app/repository/team_repository.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/core/core_module.dart';
import 'package:team_draw/modules/home/routes/home_navigator_routes.dart';
import 'package:team_draw/modules/home/view/gallery/gallery_view.dart';
import 'package:team_draw/modules/home/view/gallery/video_player_widget.dart';
import 'package:team_draw/modules/home/view/home_nav_bar_base_view.dart';
import 'package:team_draw/modules/home/view_model/expandable_button_controller.dart';
import 'package:team_draw/modules/home/view_model/gallery_view_model.dart';
import 'package:team_draw/modules/home/view_model/home_view_model.dart';
import 'package:team_draw/repository/match_repository.dart';
import 'package:team_draw/services/media_service.dart';
import 'package:team_draw/services/team_match_service.dart';
import 'package:team_draw/services/team_service.dart';

class HomeModule extends Module {
  static const durationTransaction = 200;

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(i) {
    i.addSingleton(TeamRepository.new);
    i.addSingleton(TeamService.new);
    i.addSingleton(TeamMatchRepository.new);
    i.addSingleton(TeamMatchService.new);
    i.addSingleton(HomeViewModel.new);
    i.addLazySingleton(ExpandableButtonController.new);
    i.addLazySingleton(ImagePicker.new);
    i.add(MediaService.new);
    i.addLazySingleton(HomeNavigatorRoutes.new);
    i.add(GalleryViewModel.new);
  }

  @override
  void routes(r) {
    r.child(
      startRote,
      child: (context) => const HomeNavBarBaseView(),
    );
    r.child(
      galleryRoute,
      child: (context) => const GalleryView(),
    );
    r.child(
      videoPlayerRoute,
      child: (context) => VideoPlayerWidget(video: r.args.data["video"]),
    );
  }
}
