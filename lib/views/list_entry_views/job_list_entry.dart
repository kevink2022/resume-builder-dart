import 'package:flutter/material.dart';
import 'package:resume_builder/models/job.dart';

class JobListEntry extends StatelessWidget {
  final Job job;

  const JobListEntry({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        job.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(job.employer),
          Text(
            '${job.startDate} - ${job.endDate}',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
