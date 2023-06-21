import 'package:team_draw/data/match_data.dart';
import 'package:team_draw/data/player_data.dart';
import 'package:team_draw/data/team_data.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/model/team_match.dart';

class HomeRepository{

  Future<List<Team>> findAllTeams() async{
    return getAllTeams;
  }

  Future<List<TeamMatch>> findAllMatches() async{
    return getAllMatches;
  }

  Future<List<Player>> findAllPlayers() async{
     return getAllPlayers;
  }
}