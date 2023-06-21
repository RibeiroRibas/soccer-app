import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class DefaultPageLayout extends StatelessWidget {
  final String tittle;
  final Widget body;
  final Widget buttonNavigationBar;
  final VoidCallback onBackPress;

  const DefaultPageLayout({
    Key? key,
    required this.tittle,
    required this.body,
    required this.buttonNavigationBar,
    required this.onBackPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            tittle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: onBackPress,
            icon: Icon(
              Icons.arrow_back,
              color: greenTheme.primaryColor,
            ),
          ),
        ),
        bottomNavigationBar: buttonNavigationBar,
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: body,
        ),
      ),
    );
  }
}
