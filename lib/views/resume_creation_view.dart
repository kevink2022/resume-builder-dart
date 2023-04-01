import 'package:flutter/material.dart';
import 'package:resume_builder/viewmodels/manager.dart';
import 'package:resume_builder/models/export.dart';
import 'package:resume_builder/views/list_entry_views/export.dart';

class ResumeCreationView extends StatefulWidget {
  final Manager manager;

  ResumeCreationView({required this.manager});

  @override
  _ResumeCreationViewState createState() => _ResumeCreationViewState();
}

class _ResumeCreationViewState extends State<ResumeCreationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Creation'),
      ),
      body: ListView.builder(
        itemCount: widget.manager.resume.sections.length,
        itemBuilder: (context, sectionIndex) {
          Section section = widget.manager.resume.sections[sectionIndex];

          return Column(
            children: [
              SectionListEntry(
                section: section,
                onSectionToggle: (_) {
                  setState(() {});
                },
              ),
              ...section.components
                  .where((component) => section.isChecked)
                  .map((component) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: ComponentListEntry(
                        component: component,
                        onComponentToggle: (_) {
                          setState(() {});
                        },
                      ),
                    ),
                    ...component.bullets
                        .where((bullet) => component.isChecked)
                        .map((bullet) {
                      return Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: BulletListEntry(
                            bullet: bullet,
                            onBulletToggle: (_) {
                              setState(() {});
                            },
                          ));
                    }).toList(),
                  ],
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }
}
