import 'package:flutter/material.dart';
import 'package:team_draw/shared/ui/component/text_with_border_component.dart';

class AppBarTittleWithCloseButtonComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Function onCloseAction;

  const AppBarTittleWithCloseButtonComponent(
      {super.key, required this.title, required this.onCloseAction});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextWithBorderComponent(
        text: title,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () => onCloseAction(),
          icon: Icon(
            Icons.close,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
