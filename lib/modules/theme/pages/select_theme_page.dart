import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:team_draw/data/shield_data.dart';
import 'package:team_draw/modules/theme/controllers/theme_controller.dart';
import 'package:team_draw/modules/theme/model/theme_name.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_resolve.dart';

class SelectThemePage extends StatefulWidget {
  const SelectThemePage({super.key});

  @override
  State<SelectThemePage> createState() => _SelectThemePageState();
}

class _SelectThemePageState extends State<SelectThemePage> {
  final _controller = Modular.get<ThemeController>();

  List<Widget> imageSliders() {
    return ThemeName.values
        .map((themeName) => GestureDetector(
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                              color: Colors.white24,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Image(
                                image: AssetImage(
                                    ThemeResolve.layoutFromName(themeName)),
                              )),
                        ),
                      ],
                    )),
              ),
              onTap: () => _controller.setSelectedTheme(themeName),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("$imageInitialPath/soccer-field.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextWithBorderWidget(text: welcome, fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(right: 8.0, left: 8.0),
              child: TextWithBorderWidget(text: selectTheme, fontSize: 18),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders(),
            ),
          ],
        ),
      ),
    );
  }
}

class TextWithBorderWidget extends StatelessWidget {
  final String text;
  final double fontSize;

  const TextWithBorderWidget(
      {super.key, required this.fontSize, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = Colors.black,
          ),
          softWrap: true,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
          softWrap: true,
        )
      ],
    );
  }
}
