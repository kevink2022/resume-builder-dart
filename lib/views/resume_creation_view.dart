import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/viewmodels/manager.dart';
import 'package:resume_builder/models/export.dart';
import 'package:resume_builder/views/list_entry_views/export.dart';
import 'package:resume_builder/views/resume_creation_view.dart';
import 'package:resume_builder/views/view_constants.dart';

class ResumeCreationView extends StatefulWidget {
  final Manager manager;

  ResumeCreationView({required this.manager});

  @override
  _ResumeCreationViewState createState() => _ResumeCreationViewState();
}

class _ResumeCreationViewState extends State<ResumeCreationView> {
  @override
  Widget build(BuildContext context) {
    // final manager = Provider.of<Manager>(context, listen: false);
    final manager = widget.manager;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Resume Creation'),
          ),
          body: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(ViewConstants.standardIndent),
                child: Text(
                  'Links',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              ...widget.manager.resume.links.map((link) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: ViewConstants.standardIndent),
                  child: LinkListEntry(
                    link: link,
                    onLinkToggle: (_) {
                      setState(() {});
                    },
                  ),
                );
              }).toList(),
              ...widget.manager.resume.sections.map((section) {
                return SectionListEntry(
                  section: section,
                  onSectionToggle: (_) {
                    setState(() {});
                  },
                );
              }).toList(),
            ],
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () => manager.generateTeX(),
            child: Icon(Icons.save_alt),
            tooltip: 'Generate TeX',
          ),
        ),
      ],
    );
  }
}
