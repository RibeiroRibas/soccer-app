import 'package:flutter/material.dart';

class ForwardButtonComponent extends StatelessWidget {
  final Function onPressed;
  final bool isShowButton;

  const ForwardButtonComponent(
      {super.key, required this.onPressed, this.isShowButton = true});

  @override
  Widget build(BuildContext context) {
    return isShowButton
        ? IconButton(
            onPressed: () => onPressed(),
            icon: Icon(
              Icons.arrow_forward,
              weight: 0.5,
              color: Theme.of(context).primaryColor,
            ),
          )
        : const SizedBox();
  }
}
