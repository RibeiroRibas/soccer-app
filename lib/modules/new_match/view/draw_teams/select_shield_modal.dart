import 'package:flutter/material.dart';
import 'package:team_draw/data/shield_data.dart';

class ModalSelectShieldWidget extends StatelessWidget {
  final Function(String) onShieldSelected;

  const ModalSelectShieldWidget({super.key, required this.onShieldSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
          ),
          itemCount: getAllShields.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: GestureDetector(
                onTap: () {
                  onShieldSelected(getAllShields.elementAt(index));
                  Navigator.pop(context);
                },
                child: Image(
                  image: AssetImage(getAllShields.elementAt(index)),
                  height: 35,
                ),
              ),
            );
          }),
    );
  }
}
