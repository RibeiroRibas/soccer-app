import 'package:flutter/material.dart';

class MatchCheckBoxWidget extends StatefulWidget {
  final String description;
  final bool? isChecked;
  final Function(bool) onItemSelected;
  final ListTileControlAffinity? controlAffinity;

  const MatchCheckBoxWidget(
      {Key? key,
      required this.description,
      required this.isChecked,
      required this.onItemSelected,
      this.controlAffinity})
      : super(key: key);

  @override
  State<MatchCheckBoxWidget> createState() => _MatchCheckBoxWidgetState();
}

class _MatchCheckBoxWidgetState extends State<MatchCheckBoxWidget> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.description,
        style: const TextStyle(fontSize: 12),
      ),
      controlAffinity:
          widget.controlAffinity ?? ListTileControlAffinity.platform,
      value: isChecked,
      contentPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      onChanged: (value) {
        setState(() {
          isChecked = value!;
          widget.onItemSelected(isChecked);
        });
      },
    );
  }
}
