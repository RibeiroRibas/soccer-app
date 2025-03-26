import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_shield.dart';
import 'package:team_draw/modules/new_match/ui/modal/select_name_modal.dart';
import 'package:team_draw/modules/new_match/ui/modal/select_shield_modal.dart';

class TeamNameAndShieldComponent extends StatelessWidget {
  final Team team;
  final Function(String, String) onTeamNameChange;
  final Function(TeamShield, TeamShield) onChangeTeamShield;
  final List<String> availableNames;

  const TeamNameAndShieldComponent({
    super.key,
    required this.team,
    required this.onTeamNameChange,
    required this.onChangeTeamShield,
    required this.availableNames,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.11,
            height: 45,
            padding: const EdgeInsets.only(right: 10, bottom: 8, top: 4),
            child: Image(
              image: AssetImage(team.shield!.resourcePath),
              height: 35,
            ),
          ),
          onTap: () => showBarModalBottomSheet(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context: context,
            builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: ModalSelectShieldWidget(
                onShieldSelected: (shield) =>
                    onChangeTeamShield.call(team.shield!, shield),
              ),
            ),
          ),
        ),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.only(top: 6),
            width: MediaQuery.of(context).size.width * 0.3,
            height: 40,
            child: Text(
              team.name!,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.start,
            ),
          ),
          onTap: () => showBarModalBottomSheet(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            context: context,
            builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: SelectNameModal(
                name: team.name!,
                onNameChanged: (newName) => onTeamNameChange.call(
                  team.name!,
                  newName,
                ),
                availableNames: availableNames,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
