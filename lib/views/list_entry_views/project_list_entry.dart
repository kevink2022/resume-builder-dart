import 'package:flutter/material.dart';
import 'package:resume_builder/models/project.dart';
import 'package:resume_builder/views/list_entry_views/bullet_list_entry.dart';

class ProjectListEntry extends StatefulWidget {
  final Project project;
  final ValueChanged<bool?>? onComponentToggle;

  ProjectListEntry({required this.project, this.onComponentToggle});

  @override
  _ProjectListEntryState createState() => _ProjectListEntryState();
}

class _ProjectListEntryState extends State<ProjectListEntry> {
  @override
  Widget build(BuildContext context) {
    // Your custom formatting code for projectListEntry
    return Column(
      children: [
        CheckboxListTile(
          title: Text(
            widget.project.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.project.startDate} - ${widget.project.endDate}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          value: widget.project.isChecked,
          onChanged: (bool? value) {
            setState(() {
              widget.project.isChecked = value!;
            });
            if (widget.onComponentToggle != null) {
              widget.onComponentToggle!(value);
            }
          },
        ),
        // Display bullets
        if (widget.project.isChecked) ...[
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Skills',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          ...widget.project.skills.map((bullet) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: BulletListEntry(
                bullet: bullet,
                onBulletToggle: (_) {
                  setState(() {});
                },
              ),
            );
          }).toList(),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Bullets',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          ...widget.project.bullets.map((bullet) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: BulletListEntry(
                bullet: bullet,
                onBulletToggle: (_) {
                  setState(() {});
                },
              ),
            );
          }).toList(),
        ]
      ],
    );
  }
}
