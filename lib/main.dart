import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/viewmodels/manager.dart';
import 'package:resume_builder/views/resume_creation_view.dart';

void main() {
  Manager manager = Manager();
  runApp(ResumeBuilderApp(manager: manager));
}

class ResumeBuilderApp extends StatelessWidget {
  final Manager manager;

  const ResumeBuilderApp({required this.manager});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Manager>(
      create: (context) =>
          Manager(), // Create an instance of your Manager class
      child: MaterialApp(
        title: 'Resume Builder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ResumeCreationView(manager: manager),
      ),
    );
  }
}

/* 

JSON wont load from file

Expand List entries

Add list editing

Add order editing

Create tex files

*/ 