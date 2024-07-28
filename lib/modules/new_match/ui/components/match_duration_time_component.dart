import 'package:flutter/material.dart';
import 'package:team_draw/shared/helper/list_helper.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/ui/component/drop_down_button_component.dart';

class MatchDurationTimeComponent extends StatelessWidget {
  final int? durationHr;
  final int? durationMin;
  final Function(dynamic) onDurationHrChange;
  final Function(dynamic) onDurationMinChange;

  const MatchDurationTimeComponent({
    super.key,
    this.durationHr,
    this.durationMin,
    required this.onDurationHrChange,
    required this.onDurationMinChange,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Expanded(child: Text(duration)),
        DropDownButtonComponent(
          value: durationHr.toString(),
          onValueChange: onDurationHrChange,
          width: MediaQuery.of(context).size.width / 4,
          values: ListHelper.getListOfHours(),
          labelText: hour,
        ),
        const SizedBox(width: 2),
        DropDownButtonComponent(
          value: durationMin.toString(),
          onValueChange: onDurationMinChange,
          width: MediaQuery.of(context).size.width / 4,
          values: ListHelper.getListOfMinutes(),
          labelText: minute,
        ),
      ],
    );
  }
}
