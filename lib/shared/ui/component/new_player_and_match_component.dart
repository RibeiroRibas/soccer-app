import 'package:flutter/material.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/elevated_button_component.dart';

class NewPlayerAndMatchComponent extends StatelessWidget {
  final String message;
  final Function(String) goToNewPlayerRoute;
  final Function(String) goToNewMatchRoute;
  final bool isShowNewMatchButton;

  const NewPlayerAndMatchComponent({
    super.key,
    required this.message,
    required this.goToNewPlayerRoute,
    required this.goToNewMatchRoute,
    this.isShowNewMatchButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text(
          message,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: ElevatedButtonComponent(
            onButtonPressed: () => goToNewPlayerRoute(newPlayerRote),
            text: newPLayer,
          ),
        ),
        const SizedBox(height: 10),
        if (isShowNewMatchButton)
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: ElevatedButtonComponent(
              onButtonPressed: () => goToNewMatchRoute(newMatchRote),
              text: newMatch,
            ),
          ),
      ],
    );
  }
}
