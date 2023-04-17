import 'package:resume_builder/models/bullet.dart';
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
    required List<Bullet> bullets,
  }) : super(title: title, bullets: bullets);

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'],
      employer: json['employer'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      location: json['location'],
      bullets:
          List<Bullet>.from(json['bullets'].map((x) => Bullet.fromJson(x))),
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

  @override
  String toLaTeX() {
    // Filter the bullets based on whether isChecked is true
    List<Bullet> checkedBullets =
        bullets.where((bullet) => bullet.isChecked).toList();

    // Generate the LaTeX code for each checked bullet using Bullet's toLaTeX method
    String bulletLaTeX =
        checkedBullets.map((bullet) => bullet.toLaTeX()).join('\n');

    return '''
\\resumeJob
  {$title}{$startDate} -- {$endDate}
  {$employer}{$location}
  \\resumeBulletListStart
    $bulletLaTeX
  \\resumeBulletListEnd
''';
  }
}
