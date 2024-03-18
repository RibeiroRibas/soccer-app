import 'package:flutter/material.dart';
import 'package:team_draw/modules/new_match/model/team_information.dart';
import 'package:team_draw/shared/helper/list_helper.dart';

class TeamsInformationWidget extends StatelessWidget {
  final TeamInformation teamsInformation;

  const TeamsInformationWidget({super.key, required this.teamsInformation});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        ListHelper.getInformationDescription().length,
        (index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(teamsInformation.teamOne.elementAt(index)),
              Text(ListHelper.getInformationDescription().elementAt(index)),
              Text(teamsInformation.teamTwo.elementAt(index)),
            ],
          );
        },
      ),
    );
  }
}
