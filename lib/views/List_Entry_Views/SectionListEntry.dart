import 'package:flutter/material.dart';
import 'package:resume_builder/models/section.dart';

class SectionListEntry extends StatelessWidget {
  final Section section;

  SectionListEntry({required this.section});

  @override
  Widget build(BuildContext context) {
    return Text(
      section.title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
    );
  }
}
