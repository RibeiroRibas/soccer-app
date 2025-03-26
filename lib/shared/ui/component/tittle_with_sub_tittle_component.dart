import 'package:flutter/material.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class TittleWithSubTittleComponent extends StatelessWidget {
  final String tittle;
  final String subTittle;

  const TittleWithSubTittleComponent({
    super.key,
    required this.tittle,
    required this.subTittle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          TextWithBorderComponent(
              text: tittle, textStyle: Theme.of(context).textTheme.bodyLarge!),
          Text(subTittle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
