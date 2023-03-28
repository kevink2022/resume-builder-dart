import 'package:resume_builder/models/section.dart';
import 'component.dart';


class Job extends Component {
  String employer;
  String startDate;
  String endDate;
  String location;

  Job({
    required this.employer,
    required this.startDate,
    required this.endDate,
    required this.location,
    required String title,
    required List<String> bullets,
  }) : super(title: title, bullets: bullets);

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      employer: json['employer'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      location: json['location'],
      bullets: List<String>.from(json['bullets'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'employer': employer,
      'start_date': startDate,
      'end_date': endDate,
      'location': location,
      'bullets': bullets,
    };
  }
}