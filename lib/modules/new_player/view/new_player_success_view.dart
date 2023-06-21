import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/modules/new_player/view_model/player_view_model.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/ui/component/elevated_button_component.dart';
import 'package:team_draw/ui/component/text_with_border_component.dart';

class NewPlayerSuccessView extends StatelessWidget {

  const NewPlayerSuccessView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewPlayerRoutes navigator = Modular.get<NewPlayerRoutes>();
    final PlayerViewModel viewModel = Modular.get<PlayerViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TextWithBorderComponent(
            text: newPlayerSuccess,
            textStyle: greenTheme.textTheme.displayLarge,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const Image(
                image: AssetImage('assets/images/new_player.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
                child: Text(
                  '${viewModel.player.name}',
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.backgroundColor),
                ),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Lottie.asset('assets/animations/soccer_fans.json'),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButtonComponent(
              onButtonPressed: () {
                navigator.goTo('$newPlayerRote/', null);
                viewModel.resetObservables();
              },
              text: addNewPlayer,
            ),
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButtonComponent(
        onButtonPressed: () {
          navigator.goTo(startRote, null);
        },
        text: conclude,
      ),
    );
  }
}
