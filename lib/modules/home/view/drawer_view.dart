import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:team_draw/data/profile_data.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/routes/home_navigator_routes.dart';
import 'package:team_draw/modules/home/view_model/drawer_view_model.dart';
import 'package:team_draw/services/media_service.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  final HomeNavigatorRoutes navigator = Modular.get<HomeNavigatorRoutes>();
  final DrawerViewModel viewModel = Modular.get<DrawerViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(
          builder: (_) => GestureDetector(
            child: viewModel.image == null
                ? const Image(
                    image: AssetImage("$imageInitialPath/empty-image.png"),
                    height: 150,
                  )
                : Image.memory(
                    base64Decode(viewModel.image!),
                    fit: BoxFit.cover,
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                  ),
            onTap: () => viewModel.onImageTap(),
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
          onPressed: () => navigator.goTo(selectThemeRoute, null),
          child: Text(
            themes,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () => navigator.goTo('$galleryRoute/', null),
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
        ]),
      ],
    );
  }

  @override
  void dispose() {
    Modular.dispose<MediaService>();
    super.dispose();
  }
}
