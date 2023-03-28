import 'package:flutter/material.dart';
import 'package:resume_builder/models/job.dart';

class JobListEntry extends StatelessWidget {
  final Job job;

  JobListEntry({required this.job});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${job.title} | ${job.employer}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('${job.startDate} - ${job.endDate}'),
      ],
    );
  }
}
