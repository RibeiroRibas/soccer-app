import 'package:flutter/material.dart';
import 'package:team_draw/shared/components/box_card_component.dart';

import '../tittle_section.dart';
import '../../i18n/messages.dart';
import 'all_matches_widget.dart';

class HistoryMatchesSection extends StatelessWidget {
  const HistoryMatchesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:
                EdgeInsets.only(top: 16.0, bottom: 8.0, left: 4.0, right: 8.0),
            child: TittleSection(tittle: historyMatches)
          ),
          BoxCardComponent(
            boxCardBody: const AllMatchesWidget(),
            height: 50,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
