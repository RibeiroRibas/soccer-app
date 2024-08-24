import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/data/profile_data.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/modules/home/controllers/drawer_menu_controller.dart';
import 'package:team_draw/modules/home/home_route_navigator.dart';
import 'package:team_draw/shared/services/media_service.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';
import 'package:team_draw/shared/ui/dialogs/permission_denied_dialog.dart';

class DrawerMenuComponent extends StatefulWidget {
  const DrawerMenuComponent({super.key});

  @override
  State<DrawerMenuComponent> createState() => _DrawerMenuComponentState();
}

class _DrawerMenuComponentState extends State<DrawerMenuComponent> {
  final _navigator = Modular.get<HomeRouteNavigator>();
  final _viewModel = Modular.get<DrawerMenuController>();
  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    _viewModel.init();
    disposer =
        reaction((_) => _viewModel.isMediaLocationPermanentlyDenied, (_) {
      _showPermissionDeniedDialog();
    });
  }

  Future<void> _showPermissionDeniedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PermissionDeniedDialog(onCloseDialog: () => _navigator.pop);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(
          builder: (_) => GestureDetector(
            child: _viewModel.image == null
                ? const Image(
                    image: AssetImage("$imageInitialPath/empty-image.png"),
                    height: 150,
                  )
                : Image.memory(
                    base64Decode(_viewModel.image!),
                    fit: BoxFit.cover,
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                  ),
            onTap: () => _viewModel.onImageTap(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: TextWithBorderComponent(
            text: sprProfile.name,
            textStyle: Theme.of(context).textTheme.bodyLarge!,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () => _navigator.goTo(selectThemeRoute),
          child: Text(
            themes,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () => _navigator.goTo('$galleryRoute/'),
          child: Text(
            gallery,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Expanded(child: SizedBox()),
        const Row(children: [
          Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage("$imageInitialPath/sagrado-fut-splash.png"),
              height: 50,
            ),
          ),
          Expanded(child: SizedBox()),
        ]),
      ],
    );
  }

  @override
  void dispose() {
    disposer();
    Modular.dispose<MediaService>();
    super.dispose();
  }
}
