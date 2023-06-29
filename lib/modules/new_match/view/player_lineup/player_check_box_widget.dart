import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';

class PlayerCheckBoxWidget extends StatefulWidget {
  final Player player;
  final bool isChecked;
  final Function(Player) onItemSelected;

  const PlayerCheckBoxWidget({
    Key? key,
    required this.player,
    required this.isChecked,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  State<PlayerCheckBoxWidget> createState() => _CheckBoxPlayerState();
}

class _CheckBoxPlayerState extends State<PlayerCheckBoxWidget> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.player.name!,
        softWrap: false,
      ),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          widget.onItemSelected(widget.player);
          isChecked = value!;
        });
      },
    );
  }
}
