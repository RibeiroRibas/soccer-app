import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/new_match/controllers/result_match_conotroller.dart';
import 'package:team_draw/modules/new_match/new_match_rote_navigator.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/elevated_button_component.dart';
import 'package:team_draw/shared/ui/component/result_match_component.dart';
import 'package:team_draw/shared/ui/component/teams_info_component.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';
import 'package:team_draw/shared/ui/list_item/player_goals_list_item.dart';

class ResultMatchPage extends StatefulWidget {
  final List<TeamMatch> matches;
  final MatchSettings matchSettings;

  const ResultMatchPage(
      {super.key, required this.matches, required this.matchSettings});

  @override
  State<ResultMatchPage> createState() => _ResultMatchPageState();
}

class _ResultMatchPageState extends State<ResultMatchPage> {
  final controller = Modular.get<ResultMatchController>();
  final _navigator = Modular.get<NewMatchRoteNavigator>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    controller.init(widget.matches);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 25),
              ResultMatchComponent(match: controller.match),
              TeamsInformationComponent(
                  teamsInformation: controller.teamInformation),
              const SizedBox(height: 30),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PlayerGoalsListItem(
                      match: controller.match,
                      playerGoalAtTime: controller.playersGoalAtTime[index]);
                },
                itemCount: controller.playersGoalAtTime.length,
              ),
            ],
          ),
        ),
      ),
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
