import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/team_match.dart';
import 'package:team_draw/modules/match/match_view_model.dart';
import 'package:team_draw/modules/match/view/match_score_widget.dart';
import 'package:team_draw/modules/match/view/reserve_players_widget.dart';
import 'package:team_draw/modules/match/view/starting_players_widget.dart';
import 'package:team_draw/modules/match/view/team_shield_widget.dart';

class MatchView extends StatefulWidget {
  final List<TeamMatch> matches;
  final MatchSettings matchSettings;

  const MatchView(
      {super.key, required this.matches, required this.matchSettings});

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final MatchViewModel viewModel = Modular.get<MatchViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init(widget.matches, widget.matchSettings);
    _setOrientation();
  }

  Future<void> _setOrientation() async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft]);
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("$imageInitialPath/soccer-field-landscape.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          TeamShieldWidget(
            shieldTeamOne: viewModel.match.teamOne!.shield!.resourcePath,
            shieldTeamTwo: viewModel.match.teamTwo!.shield!.resourcePath,
          ),
          Observer(
            builder: (_) => MatchScoreWidget(
              scoreTeamOne: viewModel.scoreTeamOne,
              scoreTeamTwo: viewModel.scoreTeamTwo,
              increaseScoreTeamOne: () => viewModel.increaseScoreTeamOne(),
              increaseScoreTeamTwo: () => viewModel.increaseScoreTeamTwo(),
              decreaseScoreTeamOne: () => viewModel.decreaseScoreTeamOne(),
              decreaseScoreTeamTwo: () => viewModel.decreaseScoreTeamTwo(),
            ),
          ),
          StartingPlayersWidget(
              isTeamLeftSide: true,
              players: viewModel.playersTeamOne,
              teamColor: viewModel.resolveColorTeamOne()),
          StartingPlayersWidget(
              isTeamLeftSide: false,
              players: viewModel.playersTeamTwo,
              teamColor: viewModel.resolveColorTeamTwo()),
          const ReservePlayersWidget(),
        ],
      ),
    );
  }
}
