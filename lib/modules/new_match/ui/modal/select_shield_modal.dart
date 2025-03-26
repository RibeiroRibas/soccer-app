import 'package:flutter/material.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/model/team_shield.dart';

class ModalSelectShieldWidget extends StatelessWidget {
  final Function(TeamShield) onShieldSelected;

  const ModalSelectShieldWidget({super.key, required this.onShieldSelected});

  @override
  Widget build(BuildContext context) {
    List<TeamShield> shields = getAllShields;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemCount: shields.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: GestureDetector(
                onTap: () {
                  onShieldSelected(shields.elementAt(index));
                  Navigator.pop(context);
                },
                child: Image(
                  image: AssetImage(shields.elementAt(index).resourcePath),
                  height: 35,
                ),
              ),
            );
          }),
    );
  }
}
