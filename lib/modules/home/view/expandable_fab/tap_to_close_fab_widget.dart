import 'package:flutter/material.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class TapToCloseFabWidget extends StatelessWidget {
  final VoidCallback onTapButton;

  const TapToCloseFabWidget({Key? key, required this.onTapButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          color: ThemeColors.backgroundColor,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: onTapButton,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
