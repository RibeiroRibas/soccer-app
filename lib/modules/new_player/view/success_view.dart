import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:team_draw/modules/app/route_named.dart';
import 'package:team_draw/modules/new_player/routes/new_player_rote_navigator.dart';
import 'package:team_draw/shared/theme/green_theme.dart';

class SuccessView extends StatefulWidget {
  const SuccessView({Key? key}) : super(key: key);

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  final NewPlayerRoutes navigator = Modular.get<NewPlayerRoutes>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((_) => navigator.goTo(startRote, null));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenTheme.primaryColor,
      body: Center(child: Lottie.asset('assets/animations/success.json')),
    );
  }
}
