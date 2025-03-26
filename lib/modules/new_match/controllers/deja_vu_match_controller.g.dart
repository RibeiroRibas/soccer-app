// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deja_vu_match_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DejaVuMatchController on DejaVuMatchControllerBase, Store {
  late final _$matchesDetailAtom =
      Atom(name: 'DejaVuMatchControllerBase.matchesDetail', context: context);

  @override
  List<MatchDetails> get matchesDetail {
    _$matchesDetailAtom.reportRead();
    return super.matchesDetail;
  }

  @override
  set matchesDetail(List<MatchDetails> value) {
    _$matchesDetailAtom.reportWrite(value, super.matchesDetail, () {
      super.matchesDetail = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('DejaVuMatchControllerBase.init', context: context);

  @override
  Future<void> init(
      Map<Player, bool> selectedPlayers, MatchSettings matchSettings) {
    return _$initAsyncAction
        .run(() => super.init(selectedPlayers, matchSettings));
  }

  @override
  String toString() {
    return '''
matchesDetail: ${matchesDetail}
    ''';
  }
}
