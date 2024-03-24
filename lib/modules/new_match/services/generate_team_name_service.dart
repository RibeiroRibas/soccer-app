import 'package:team_draw/data/team_name_data.dart';
import 'package:team_draw/model/team.dart';
import 'package:team_draw/modules/app/repository/local_storage_repository.dart';

class GenerateTeamNameService {
  final LocalStorageRepository counterTeamRepository;

  GenerateTeamNameService(this.counterTeamRepository);

  final _counterTeamRepositoryKey = "counterTeam";
  final String _time = "Time";
  final List<String> _temporaryUsedNames = [];
  int _lastGeneratedSequentialNumber = 0;

  Future<String> generateTeamName(List<Team> allTeams) async {
    String? name;

    final List<String> allCachedNames = [];
    allCachedNames.addAll(getAllTeamNames);

    for (Team team in allTeams) {
      allCachedNames.removeWhere((teamName) => teamName == team.name);
    }

    if (allCachedNames.isNotEmpty) {
      for (String cachedName in allCachedNames) {
        if (!_temporaryUsedNames
            .any((temporaryName) => temporaryName == cachedName)) {
          name = cachedName;
          _temporaryUsedNames.add(cachedName);
          break;
        }
      }
    }

    return name ?? await generateSequentialName();
  }

  Future<String> generateSequentialName() async {
    if (_lastGeneratedSequentialNumber > 0) {
      _lastGeneratedSequentialNumber = _lastGeneratedSequentialNumber + 1;
      return "$_time $_lastGeneratedSequentialNumber";
    }

    int? lastSavedSequentialNumber =
        await counterTeamRepository.read<int>(_counterTeamRepositoryKey);

    if (lastSavedSequentialNumber != null) {
      _lastGeneratedSequentialNumber = _lastGeneratedSequentialNumber + 1;
      return "$_time $_lastGeneratedSequentialNumber";
    }

    _lastGeneratedSequentialNumber = 1;
    return "$_time $_lastGeneratedSequentialNumber";
  }
}
