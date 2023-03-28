import 'package:flutter/material.dart';
import 'package:resume_builder/models/section.dart';
import 'package:resume_builder/viewmodels/manager.dart';
import 'package:resume_builder/views/List_Entry_Views/SectionListEntry.dart';
import 'package:resume_builder/views/List_Entry_Views/JobListEntry.dart';
import 'package:resume_builder/views/List_Entry_Views/ProjectListEntry.dart';
import 'package:resume_builder/views/List_Entry_Views/BulletListEntry.dart';

class ResumeCreationView extends StatefulWidget {
  final Manager manager;

  ResumeCreationView({required this.manager});

  @override
  _ResumeCreationViewState createState() => _ResumeCreationViewState();
}

class _ResumeCreationViewState extends State<ResumeCreationView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.manager.resumeLoaded,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // Build your UI here
          return _buildResumeCreationContent();
        } else {
          // Show a loading indicator or a placeholder while data is loading
          return Scaffold(
            appBar: AppBar(title: const Text('Resume Creation')),
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget _buildResumeCreationContent() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Creation'),
      ),
      body: ListView.builder(
        itemCount: widget.manager.resume.sections.length,
        itemBuilder: (context, index) {
          Section section = widget.manager.resume.sections[index];
          return CheckboxListTile(
            title: SectionListEntry(section: section),
            value: widget.manager.checkedSections[index],
            onChanged: (bool? value) {
              setState(() {
                widget.manager.checkedSections[index] = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.manager.printCheckedBoxes();
        },
        child: const Icon(Icons.print),
      ),
    );
  }
}
