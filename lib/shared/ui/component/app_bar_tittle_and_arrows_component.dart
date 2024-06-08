import 'package:flutter/material.dart';

class AppBarTittleAndArrowsComponent extends StatelessWidget
    implements PreferredSizeWidget {
  final String tittle;
  final Function onBackAction;
  final List<Widget>? forwardButtonAction;

  const AppBarTittleAndArrowsComponent(
      {super.key,
      required this.tittle,
      required this.onBackAction,
      this.forwardButtonAction});

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
      leading: IconButton(
        onPressed: () => onBackAction(),
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        ),
      ),
      actions: forwardButtonAction,
    );
  }
}
