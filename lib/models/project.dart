import 'package:resume_builder/models/section.dart';
import 'component.dart';

class Project extends Component {
  // String title;
  String startDate;
  String endDate;
  List<String> skills;
  // List<String> bullets;

  Project({
    required this.startDate,
    required this.endDate,
    required this.skills,
    required String title,
    required List<String> bullets,
  }) : super(title: title, bullets: bullets);

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      skills: List<String>.from(json['skills'].map((x) => x)),
      bullets: List<String>.from(json['bullets'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'start_date': startDate,
      'end_date': endDate,
      'skills': skills,
      'bullets': bullets,
    };
  }
}