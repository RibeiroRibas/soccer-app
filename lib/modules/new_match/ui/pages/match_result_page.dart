import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/modules/new_match/controllers/result_match_controller.dart';
import 'package:team_draw/modules/new_match/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/ui/components/match_result_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/elevated_button_component.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class MatchResultPage extends StatefulWidget {
  final List<TeamsMatch> matches;
  final MatchSettings matchSettings;

  const MatchResultPage(
      {super.key, required this.matches, required this.matchSettings});

  @override
  State<MatchResultPage> createState() => _MatchResultPageState();
}

class _MatchResultPageState extends State<MatchResultPage> {
  final controller = Modular.get<ResultMatchController>();
  final _navigator = Modular.get<NewMatchRoteNavigator>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    controller.initFromResultMatch(widget.matches);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: TextWithBorderComponent(
          text: matchResult,
          textStyle: Theme.of(context).textTheme.titleLarge!,
        )),
      ),
      body: MatchResultComponent(
          match: controller.match,
          teamInformation: controller.teamInformation,
          playersGoalAtTime: controller.playersGoalAtTime),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButtonComponent(
                onButtonPressed: () => _navigator.goTo('$homeNavBarRoute/'),
                text: newMatchAlmostBegin,
              ),
            ),
          ),
          if (widget.matches.isNotEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButtonComponent(
                  onButtonPressed: () => _navigator.goTo("$matchRote/",
                      arguments: {
                        "matches": widget.matches,
                        "matchSettings": widget.matchSettings
                      }),
                  text: playNextMatch,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
