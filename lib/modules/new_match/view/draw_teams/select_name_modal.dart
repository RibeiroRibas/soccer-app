import 'package:flutter/material.dart';
import 'package:team_draw/data/team_name_data.dart';
import 'package:team_draw/shared/i18n/messages.dart';
import 'package:team_draw/shared/theme/green_theme.dart';
import 'package:team_draw/shared/theme/theme_colors.dart';

class SelectNameModal extends StatefulWidget {
  final String name;
  final Function(String) onNameChanged;

  const SelectNameModal(
      {super.key, required this.name, required this.onNameChanged});

  @override
  State<SelectNameModal> createState() => _SelectNameModalState();
}

class _SelectNameModalState extends State<SelectNameModal> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  late final TextEditingController _textController;
  late String _selectedName;
  int? _selectedIndex;

  @override
  void initState() {
    _selectedName = widget.name;
    _textController = TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
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
                  style: greenTheme.textTheme.displayMedium,
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
                          keyboardType: TextInputType.number,
                          validator: (String? value) =>
                              value == null || value.isEmpty
                                  ? typeTeamName
                                  : null,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: greenTheme.primaryColor)),
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
                const Divider(color: ThemeColors.division),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      splashColor: ThemeColors.primary,
                      title: Text(
                        getAllTeamNames.elementAt(index),
                        style: greenTheme.textTheme.displaySmall,
                      ),
                      tileColor:
                          _selectedIndex != null && _selectedIndex == index
                              ? ThemeColors.backgroundColor
                              : ThemeColors.cardColor,
                      onTap: () => setState(() {
                        _selectedName = getAllTeamNames.elementAt(index);
                        _textController.text = _selectedName;
                        _selectedIndex = index;
                      }),
                    );
                  },
                  itemCount: getAllTeamNames.length,
                ),
                const Divider(color: ThemeColors.division),
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
