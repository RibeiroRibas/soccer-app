import 'package:flutter/material.dart';

import '../../shared/theme/green_theme.dart';

class DefaultPageLayout extends StatelessWidget {
  final String tittle;
  final Widget body;
  final Widget buttonNavigationBar;

  const DefaultPageLayout({
    Key? key,
    required this.tittle,
    required this.body,
    required this.buttonNavigationBar,
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
            onPressed: () {},
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
