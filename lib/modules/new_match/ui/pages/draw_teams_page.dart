import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/controllers/draw_teams_controller.dart';
import 'package:team_draw/modules/new_match/new_match_rote_navigator.dart';
import 'package:team_draw/modules/new_match/ui/list_item/team_versus_list_item.dart';
import 'package:team_draw/shared/dialogs/select_player_dialog.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/box_card_component.dart';
import 'package:team_draw/shared/ui/component/elevated_button_component.dart';
import 'package:team_draw/shared/ui/component/team_lineup_component.dart';

class DrawnTeamsPage extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;
  final Function(bool) onShowForwardButton;

  const DrawnTeamsPage(
      {super.key,
      required this.selectedPlayers,
      required this.matchSettings,
      required this.onShowForwardButton});

  @override
  State<DrawnTeamsPage> createState() => _DrawnTeamsPageState();
}

class _DrawnTeamsPageState extends State<DrawnTeamsPage> {
  final _controller = Modular.get<DrawTeamsController>();
  final _navigator = Modular.get<NewMatchRoteNavigator>();

  @override
  void initState() {
    super.initState();
    widget.onShowForwardButton(false);
    reaction((_) => _controller.onUpdateData, (_) => setState(() {}));
  }

  void _drawTeams() {
    _controller.drawTeamsMatch(widget.selectedPlayers, widget.matchSettings);
  }

  Future<void> _showSelectPlayerDialog(
      List<Player> players, Player player) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SelectPlayerDialog(
              players: players,
              onPlayerTap: (selectedPlayer) => {
                    _controller.switchPlayers(player, selectedPlayer),
                    Navigator.of(context).pop()
                  });
        });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _controller.teamMatches.isEmpty
              ? Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                  child: ElevatedButtonComponent(
                    onButtonPressed: () => _drawTeams(),
                    text: sortTeams,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 25, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButtonComponent(
                        onButtonPressed: () => _drawTeams(),
                        text: sortTeams,
                      ),
                      ElevatedButtonComponent(
                        onButtonPressed: () => _navigator.goTo(matchRote, {
                          "matches": _controller.teamMatches,
                          "matchSettings": widget.matchSettings
                        }),
                        text: startMatch,
                      ),
                    ],
                  ),
                ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return TeamVersusListItem(
                  teamMatch: _controller.teamMatches.elementAt(index),
                  onTeamNameChange: _controller.onTeamNameChange,
                  availableNames: _controller.availableNames,
                  onTeamShieldChange: _controller.onTeamShieldChange,
                  teamInformation:
                      _controller.teamsInformation.elementAt(index));
            },
            childCount: _controller.teamMatches.length,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: BoxCardComponent(
                  boxCardBody: TeamLineupComponent(
                    team: _controller.sortedTeams[index],
                    onSwitchPlayer: (player) => _showSelectPlayerDialog(
                        _controller.getPlayersAnotherTeams(player), player),
                  ),
                ),
              );
            },
            childCount: _controller.sortedTeams.length,
          ),
        ),
      ],
    );
  }
}
