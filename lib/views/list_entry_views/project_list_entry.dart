import 'package:flutter/material.dart';
import 'package:resume_builder/models/project.dart';

class ProjectListEntry extends StatelessWidget {
  final Project project;

  ProjectListEntry({required this.project});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        project.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${project.startDate} - ${project.endDate}',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
