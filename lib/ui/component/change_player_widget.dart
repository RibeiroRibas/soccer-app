import 'package:flutter/material.dart';
import 'package:team_draw/ui/component/vertical_division_component.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class ChangePlayerWidget extends StatelessWidget {
  const ChangePlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Text(versus),
        ),
        const VerticalDivisionComponent(height: 65),
        Icon(
          Icons.arrow_forward,
          size: 32,
          color: greenTheme.primaryColor,
        ),
        const VerticalDivisionComponent(height: 65),
        Icon(
          Icons.arrow_back,
          size: 32,
          color: greenTheme.primaryColor,
        ),
        const VerticalDivisionComponent(height: 65),
      ],
    );
  }
}
