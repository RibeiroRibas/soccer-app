import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/data/profile_data.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/home/routes/home_navigator_routes.dart';
import 'package:team_draw/shared/view/component/text_with_border_component.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeNavigatorRoutes navigator = Modular.get<HomeNavigatorRoutes>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          image: AssetImage("assets/images/empty-image.png"),
          height: 150,
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
            "Temas",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TextButton(
          onPressed: () =>
              navigator.pushNamed('$homeNavBarRoute$galleryRoute', null),
          child: Text(
            "Galeria",
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
}
