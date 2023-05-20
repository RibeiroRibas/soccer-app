import 'package:flutter/material.dart';
import 'package:team_draw/themes/green_theme.dart';

class DefaultLayout extends StatelessWidget {
  final String tittle;
  final Widget body;
  final Widget buttonNavigationBar;

  const DefaultLayout({
    Key? key,
    required this.tittle,
    required this.body,
    required this.buttonNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: body,

    );
  }
}
