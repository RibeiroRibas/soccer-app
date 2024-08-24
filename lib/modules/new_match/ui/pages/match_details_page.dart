import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/teams_match.dart';
import 'package:team_draw/modules/new_match/controllers/result_match_controller.dart';
import 'package:team_draw/modules/new_match/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/ui/components/match_result_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/app_bar_tittle_with_close_button_component.dart';

class MatchDetailsPage extends StatefulWidget {
  final TeamsMatch match;

  const MatchDetailsPage({super.key, required this.match});

  @override
  State<MatchDetailsPage> createState() => _MatchDetailsPageState();
}

class _MatchDetailsPageState extends State<MatchDetailsPage> {
  final controller = Modular.get<ResultMatchController>();
  final _navigator = Modular.get<NewMatchRoteNavigator>();

  @override
  void initState() {
    super.initState();
    controller.initFromDetailsMatch(widget.match);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTittleWithCloseButtonComponent(
        title: matchDetails,
        onCloseAction: () => _navigator.pop(),
      ),
      body: MatchResultComponent(
          match: controller.match,
          teamInformation: controller.teamInformation,
          playersGoalAtTime: controller.playersGoalAtTime),
    );
  }
}
