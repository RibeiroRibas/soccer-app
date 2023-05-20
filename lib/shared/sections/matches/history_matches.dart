import 'package:flutter/material.dart';
import 'package:team_draw/shared/components/box_card.dart';
import 'package:team_draw/shared/matches.dart';
import 'package:team_draw/models/match.dart';
import 'package:team_draw/teams_data.dart';

class HistoryMatches extends StatelessWidget {
  const HistoryMatches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:
                EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0, right: 8.0),
            child: Text(
              "Histórico de jogos das duas equipes",
              style: TextStyle(fontWeight: FontWeight.bold),
              softWrap: true,
            ),
          ),
          BoxCard(
            boxCardBody: AllMatches(),
            height: 50,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}

class AllMatches extends StatefulWidget {
  const AllMatches({Key? key}) : super(key: key);

  @override
  State<AllMatches> createState() => _AllMatchesState();
}

class _AllMatchesState extends State<AllMatches> {
  @override
  Widget build(BuildContext context) {
    List<Match> matches = allMatches;
    return
       ListView.builder(
        itemBuilder: (context, index) {
          return Matches(match: matches[index]);
        },
        itemCount: matches.length,
        scrollDirection: Axis.horizontal,

    );
  }
}
