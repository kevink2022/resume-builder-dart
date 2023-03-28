import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:resume_builder/models/export.dart';

class Manager {
  late Resume resume;
  late List<bool> checkedSections;
  late List<List<bool>> checkedComponents;
  late List<List<List<bool>>> checkedBullets;
  late Future<void> _resumeLoaded;

  Manager() {
    _resumeLoaded = _loadResumeData();
  }

  Future<void> get resumeLoaded => _resumeLoaded;

  Future<void> _loadResumeData() async {
    String jsonData = await rootBundle.loadString('assets/example_resume.json');
    Map<String, dynamic> data = json.decode(jsonData);
    resume = Resume.fromJson(data);
    _initializeCheckedStates();
  }

  void _initializeCheckedStates() {
    checkedSections = List<bool>.filled(resume.sections.length, false);
    checkedComponents = resume.sections.map((section) => List<bool>.filled(section.components.length, false)).toList();
    checkedBullets = resume.sections.map((section) => section.components.map((component) => List<bool>.filled(component.bullets.length, false)).toList()).toList();
  }

  void setCheckedSection(int index, bool isChecked) {
    checkedSections[index] = isChecked;
  }

  void setCheckedComponent(int sectionIndex, int componentIndex, bool isChecked) {
    checkedComponents[sectionIndex][componentIndex] = isChecked;
  }

  void setCheckedBullet(int sectionIndex, int componentIndex, int bulletIndex, bool isChecked) {
    checkedBullets[sectionIndex][componentIndex][bulletIndex] = isChecked;
  }

  void printCheckedBoxes() {
    for (int i = 0; i < checkedSections.length; i++) {
      if (checkedSections[i]) {
        print("Section ${i + 1}: ${resume.sections[i].title}");
        for (int j = 0; j < checkedComponents[i].length; j++) {
          if (checkedComponents[i][j]) {
            Component component = resume.sections[i].components[j];
            String title = component.title;
            List<String> bullets = component.bullets;

            print("  Component ${j + 1}: $title");
            for (int k = 0; k < bullets.length; k++) {
              if (checkedBullets[i][j][k]) {
                print("    Bullet ${k + 1}: ${bullets[k]}");
              }
            }
          }
        }
      }
    }
  }
}

// import 'dart:convert';
// import 'package:flutter/services.dart';
// import '../models/job.dart';

// class Manager {
//   List<Job> experiences = [];

//   // Store the state of checked boxes.
//   bool showExperience = true;
//   Map<String, bool> checkedJobs = {};
//   Map<String, Map<String, bool>> checkedBullets = {};

//   // Function to initialize data from the JSON.
//   Future<void> initData() async {
//     String jsonData = await _loadUserData();
//     List<dynamic> jsonList = jsonDecode(jsonData)['experience'];
//     experiences = jsonList.map((e) => Job.fromJson(e)).toList();
//     _initializeCheckedStates();
//   }

//   Future<String> _loadUserData() async {
//     return await rootBundle.loadString('user_data/user_data.json');
//   }

//   void _initializeCheckedStates() {
//     for (Job experience in experiences) {
//       checkedJobs[experience.title] = false;
//       checkedBullets[experience.title] = {
//         for (String bullet in experience.bullets) bullet: false
//       };
//     }
//   }

//   // Function to print the checked boxes.
//   void printCheckedBoxes() {
//     print("Experience: ${showExperience ? 'checked' : 'unchecked'}");
//     for (Job experience in experiences) {
//       if (checkedJobs[experience.title]!) {
//         print("Job: ${experience.title}");
//         for (String bullet in experience.bullets) {
//           if (checkedBullets[experience.title]![bullet]!) {
//             print("Bullet: $bullet");
//           }
//         }
//       }
//     }
//   }
// }