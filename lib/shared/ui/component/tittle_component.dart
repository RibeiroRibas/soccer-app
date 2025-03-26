import 'package:flutter/material.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class TittleComponent extends StatelessWidget {
  final String tittle;

  const TittleComponent({
    super.key,
    required this.tittle,
  });

  @override
  Widget build(BuildContext context) {
    return TextWithBorderComponent(
      text: tittle,
      textStyle: Theme.of(context).textTheme.bodyLarge!,
    );
  }
}
