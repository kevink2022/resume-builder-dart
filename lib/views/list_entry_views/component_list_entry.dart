import 'package:flutter/material.dart';
import 'package:resume_builder/models/export.dart';

class ComponentListEntry extends StatefulWidget {
  final Component component;
  final ValueChanged<bool?>? onComponentToggle;

  ComponentListEntry({required this.component, this.onComponentToggle});

  @override
  _ComponentListEntryState createState() => _ComponentListEntryState();
}

class _ComponentListEntryState extends State<ComponentListEntry> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.component.title),
      value: widget.component.isChecked,
      onChanged: (bool? value) {
        setState(() {
          widget.component.isChecked = value!;
        });
        if (widget.onComponentToggle != null) {
          widget.onComponentToggle!(value);
        }
      },
    );
  }
}
