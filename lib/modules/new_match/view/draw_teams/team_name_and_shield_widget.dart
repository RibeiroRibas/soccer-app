import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/new_match/view/draw_teams/select_name_modal.dart';
import 'package:team_draw/modules/new_match/view/draw_teams/select_shield_modal.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class TeamNameAndShieldWidget extends StatelessWidget {
  final Team team;
  final Function(String, String) onChange;

  const TeamNameAndShieldWidget({
    super.key,
    required this.team,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 8),
            child: Image(
              image: AssetImage(team.shield!),
              height: 35,
            ),
          ),
          onTap: () => showBarModalBottomSheet(
            backgroundColor: greenTheme.scaffoldBackgroundColor,
            context: context,
            builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: ModalSelectShieldWidget(
                onShieldSelected: (shield) => onChange.call(team.name!, shield),
              ),
            ),
          ),
        ),
        GestureDetector(
          child: Text(team.name!),
          onTap: () => showBarModalBottomSheet(
            backgroundColor: greenTheme.scaffoldBackgroundColor,
            context: context,
            builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: SelectNameModal(
                name: team.name!,
                onNameChanged: (newName) => onChange.call(
                  team.name!,
                  newName,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
