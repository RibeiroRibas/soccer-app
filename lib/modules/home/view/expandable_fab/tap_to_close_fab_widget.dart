import 'package:flutter/material.dart';

class TapToCloseFabWidget extends StatelessWidget {
  final VoidCallback onTapButton;

  const TapToCloseFabWidget({super.key, required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          color: Theme.of(context).primaryColor,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: onTapButton,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
