import 'package:flutter/material.dart';
import 'package:resume_builder/models/export.dart';
import 'package:resume_builder/views/list_entry_views/job_list_entry.dart';
import 'package:resume_builder/views/list_entry_views/project_list_entry.dart';

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
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: componentListEntryForType(widget.component),
    );
  }
}

Widget componentListEntryForType(Component component) {
  if (component is Job) {
    return JobListEntry(job: component);
  } else if (component is Project) {
    return ProjectListEntry(project: component);
  } else {
    throw Exception("Unknown component type");
  }
}
