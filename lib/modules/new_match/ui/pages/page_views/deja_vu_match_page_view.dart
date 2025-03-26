import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/model/match_settings.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/modules/new_match/controllers/deja_vu_match_controller.dart';
import 'package:team_draw/modules/new_match/new_match_rote_navigator.dart';
import 'package:team_draw/shared/helper/date_time_format_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/routes/route_named.dart';
import 'package:team_draw/shared/ui/component/match_score_component.dart';
import 'package:team_draw/shared/ui/component/tittle_with_sub_tittle_component.dart';

class DejaVuMatchPageView extends StatefulWidget {
  final Map<Player, bool> selectedPlayers;
  final MatchSettings matchSettings;
  final Function(bool) onShowForwardButton;

  const DejaVuMatchPageView(
      {super.key,
      required this.selectedPlayers,
      required this.matchSettings,
      required this.onShowForwardButton});

  @override
  State<DejaVuMatchPageView> createState() => _DejaVuMatchPageViewState();
}

class _DejaVuMatchPageViewState extends State<DejaVuMatchPageView> {
  final _controller = Modular.get<DejaVuMatchController>();
  final _navigator = Modular.get<NewMatchRoteNavigator>();

  @override
  void initState() {
    super.initState();
    _controller.init(widget.selectedPlayers, widget.matchSettings);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Column(
              children: [
                const SizedBox(height: 20),
                TittleWithSubTittleComponent(
                    tittle: historyMatches,
                    subTittle: _controller.matchesDetail.isEmpty
                        ? hasNotHistoryMatchMessage
                        : hasHistoryMatchMessage),
                const SizedBox(height: 20),
                if (_controller.matchesDetail.isNotEmpty) ...{
                  for (int index = 0;
                      index < _controller.matchesDetail.length;
                      index++) ...{
                    CheckboxListTile(
                      value: _controller.checkBoxValues.elementAt(index),
                      onChanged: (bool? value) => _navigator.pushNamed(
                          "$newMatchRote$startDejaVuMatchRoute",
                          arguments: {
                            "matchesDetail":
                                _controller.matchesDetail.elementAt(index)
                          }),
                      title: Text(DateTimeFormatHelper.fromDateTimeToString(
                          _controller.matchesDetail
                              .elementAt(index)
                              .matches
                              .first
                              .matchDate!)),
                      subtitle: Column(
                        children: [
                          for (var match in _controller.matchesDetail
                              .elementAt(index)
                              .matches) ...{
                            MatchScoreComponent(
                                match: match, isShowTeamName: false)
                          },
                        ],
                      ),
                    ),
                  }
                }
              ],
            ));
  }
}
