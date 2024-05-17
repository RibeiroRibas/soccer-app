import 'package:flutter/material.dart';
import 'package:team_draw/data/shield_data.dart';

class ReserveBenchPlayersComponent extends StatelessWidget {
  const ReserveBenchPlayersComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          SizedBox(
            width: 60,
            child: Image.asset(
              "$imageInitialPath/switch-player.png",
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
