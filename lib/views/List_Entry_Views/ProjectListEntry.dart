import 'package:flutter/material.dart';
import 'package:resume_builder/models/project.dart';

class ProjectListEntry extends StatelessWidget {
  final Project project;

  ProjectListEntry({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('${project.startDate} - ${project.endDate}'),
      ],
    );
  }
}
