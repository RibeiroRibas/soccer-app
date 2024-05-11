import 'package:flutter/material.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class SelectNameModal extends StatefulWidget {
  final String name;
  final Function(String) onNameChanged;
  final List<String> availableNames;

  const SelectNameModal(
      {super.key,
      required this.name,
      required this.onNameChanged,
      required this.availableNames});

  @override
  State<SelectNameModal> createState() => _SelectNameModalState();
}

class _SelectNameModalState extends State<SelectNameModal> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  late final TextEditingController _textController;
  late String _selectedName;

  @override
  void initState() {
    _selectedName = widget.name;
    _textController = TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  selectName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Form(
                      key: _formKey,
                      child: Expanded(
                        child: TextFormField(
                          controller: _textController,
                          textAlign: TextAlign.center,
                          onTap: () {
                            _textController.clear();
                          },
                          focusNode: _focusNode,
                          onChanged: (text) {
                            if (_formKey.currentState!.validate()) {
                              _selectedName = text;
                            }
                          },
                          validator: (String? value) =>
                              value == null || value.isEmpty
                                  ? typeTeamName
                                  : null,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: FloatingActionButton(
                        child: const Text(ok, style: TextStyle(fontSize: 20)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.onNameChanged(_selectedName);
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      splashColor: ThemeColors.overall,
                      title: Text(
                        widget.availableNames.elementAt(index),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      tileColor: ThemeColors.grayDark,
                      onTap: () {
                        widget.onNameChanged(
                            widget.availableNames.elementAt(index));
                        Navigator.pop(context);
                      },
                    );
                  },
                  itemCount: widget.availableNames.length,
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
