import 'package:flutter/material.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_overall.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/ui/component/horizontal_division_component.dart';
import 'package:team_draw/ui/section/team_versus/widget/positions_and_overall_widget.dart';
import 'package:team_draw/ui/section/team_versus/widget/team_overall_widget.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class TeamLineupSection extends StatefulWidget {
  final Team team;
  final double cardWidth;

  const TeamLineupSection({
    Key? key,
    required this.team,
    required this.cardWidth,
  }) : super(key: key);

  @override
  State<TeamLineupSection> createState() => _TeamLineupSectionState();
}

class _TeamLineupSectionState extends State<TeamLineupSection> {

  late TeamOverall teamOverall;

  @override
  void initState() {
    super.initState();
    teamOverall = TeamOverall(widget.team);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image(
                  image: AssetImage(widget.team.shield),
                  height: 35,
                ),
              ),
              Expanded(
                child: Text(
                  widget.team.name,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: greenTheme.textTheme.displaySmall,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  teamOverall.teamOverall.toStringAsFixed(1),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: HorizontalDivisionComponent(
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: widget.team.players.length * 34,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.team.players[index].name,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    PositionsAndOverallWidget(
                        player: widget.team.players[index])
                  ],
                );
              },
              itemCount: widget.team.players.length,
              physics: const ScrollPhysics(),
            ),
          ),
          SizedBox(
            child: HorizontalDivisionComponent(
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(teamAmount, textAlign: TextAlign.end),
          ),
          TeamOverallWidget(
            overallByPosition: teamOverall.overallByPosition,
            cardWidth: widget.cardWidth,
          ),
        ],
      ),
    );
  }
}
