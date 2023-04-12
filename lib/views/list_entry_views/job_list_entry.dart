import 'package:flutter/material.dart';
import 'package:resume_builder/models/job.dart';
import 'package:resume_builder/views/list_entry_views/bullet_list_entry.dart';

class JobListEntry extends StatefulWidget {
  final Job job;
  final ValueChanged<bool?>? onComponentToggle;

  JobListEntry({required this.job, this.onComponentToggle});

  @override
  _JobListEntryState createState() => _JobListEntryState();
}

class _JobListEntryState extends State<JobListEntry> {
  @override
  Widget build(BuildContext context) {
    // Your custom formatting code for JobListEntry
    return Column(
      children: [
        CheckboxListTile(
          title: Text(
            widget.job.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.job.employer),
              Text(
                '${widget.job.startDate} - ${widget.job.endDate}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
          value: widget.job.isChecked,
          onChanged: (bool? value) {
            setState(() {
              widget.job.isChecked = value!;
            });
            if (widget.onComponentToggle != null) {
              widget.onComponentToggle!(value);
            }
          },
        ),
        // Display bullets
        if (widget.job.isChecked)
          ...widget.job.bullets.map((bullet) {
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
      ],
    );
  }
}
