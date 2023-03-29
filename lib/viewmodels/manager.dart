import 'dart:convert';
import 'package:resume_builder/models/resume.dart';
import 'package:resume_builder/models/resume_data.dart';

class Manager {
  Resume resume;

  factory Manager() {
    // String jsonData = File('assets/resume_data.json').readAsStringSync();
    // Map<String, dynamic> data = json.decode(jsonData);
    Map<String, dynamic> data = json.decode(resumeDataJson);
    return Manager._(Resume.fromJson(data));
  }

  Manager._(this.resume);
}
