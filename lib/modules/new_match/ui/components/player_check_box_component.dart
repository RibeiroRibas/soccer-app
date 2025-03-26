import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';

class PlayerCheckBoxComponent extends StatefulWidget {
  final Player player;
  final bool isChecked;
  final Function(Player) onItemSelected;

  const PlayerCheckBoxComponent({
    super.key,
    required this.player,
    required this.isChecked,
    required this.onItemSelected,
  });

  @override
  State<PlayerCheckBoxComponent> createState() => _CheckBoxPlayerState();
}

class _CheckBoxPlayerState extends State<PlayerCheckBoxComponent> {
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
        style: const TextStyle(fontSize: 14),
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
