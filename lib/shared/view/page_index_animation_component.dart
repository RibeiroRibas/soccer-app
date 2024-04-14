import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class PageIndexAnimationComponent extends StatelessWidget {
  final int pagesLength;
  final int currentPageIndex;
  final String animationPath;

  const PageIndexAnimationComponent(
      {super.key,
      required this.pagesLength,
      required this.currentPageIndex,
      required this.animationPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int index = 0; index < pagesLength; index++) ...{
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / (pagesLength + 1),
                height: 100,
                child: currentPageIndex == index
                    ? Lottie.asset(animationPath)
                    : null,
              ),
              Container(
                width: (MediaQuery.of(context).size.width / pagesLength) /
                    (pagesLength - 1),
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentPageIndex == index
                        ? Theme.of(context).primaryColor
                        : ThemeColors.shadowAnimationColor),
              ),
            ],
          ),
        },
      ],
    );
  }
}
