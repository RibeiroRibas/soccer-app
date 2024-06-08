import 'package:flutter/material.dart';

class AppBarTittleWithCloseButtonComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String tittle;
  final Function onCloseAction;

  const AppBarTittleWithCloseButtonComponent(
      {super.key, required this.tittle, required this.onCloseAction});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        tittle,
        style: const TextStyle(fontWeight: FontWeight.bold),
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
