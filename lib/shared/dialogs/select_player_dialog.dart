import 'package:flutter/material.dart';
import 'package:team_draw/model/player.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class SelectPlayerDialog extends StatelessWidget {
  final bool? isIncreaseScore;
  final List<Player> players;
  final Function(Player) onPlayerTap;

  const SelectPlayerDialog(
      {super.key,
      this.isIncreaseScore,
      required this.players,
      required this.onPlayerTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: TextWithBorderComponent(
                      text: isIncreaseScore == null
                          ? "Selecione um jogador de outro time para efetuar a troca."
                          : isIncreaseScore!
                              ? "Quem fez o gol?"
                              : "Parece que o var anulou o gol do jogador:",
                      textStyle: Theme.of(context).textTheme.titleLarge!),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        splashColor: Theme.of(context).primaryColor,
                        title: Text(
                          players.elementAt(index).name!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        tileColor: ThemeColors.grayDark,
                        onTap: () => onPlayerTap.call(players.elementAt(index)),
                      );
                    },
                    itemCount: players.length)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
