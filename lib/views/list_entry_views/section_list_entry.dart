import 'package:flutter/material.dart';
import 'package:resume_builder/models/section.dart';
import 'package:resume_builder/views/list_entry_views/component_list_entry.dart';

class SectionListEntry extends StatefulWidget {
  final Section section;
  final ValueChanged<bool?>? onSectionToggle;

  SectionListEntry({required this.section, this.onSectionToggle});

  @override
  _SectionListEntryState createState() => _SectionListEntryState();
}

class _SectionListEntryState extends State<SectionListEntry> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          title: Text(
            widget.section.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          value: widget.section.isChecked,
          onChanged: (bool? value) {
            setState(() {
              widget.section.isChecked = value!;
            });
            if (widget.onSectionToggle != null) {
              widget.onSectionToggle!(value);
            }
          },
        ),
        if (widget.section.isChecked)
          ...widget.section.components.map((component) {
            return ComponentListEntry(
              component: component,
              onComponentToggle: (_) {
                setState(() {});
              },
            );
          }).toList(),
      ],
    );
  }
}
