import 'package:resume_builder/models/bullet.dart';
import 'component.dart';

class Project extends Component {
  String startDate;
  String endDate;
  List<Bullet> skills;

  Project({
    required this.startDate,
    required this.endDate,
    required this.skills,
    required String title,
    required List<Bullet> bullets,
  }) : super(title: title, bullets: bullets);

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      skills: List<Bullet>.from(json['skills'].map((x) => Bullet.fromJson(x))),
      bullets:
          List<Bullet>.from(json['bullets'].map((x) => Bullet.fromJson(x))),
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

  @override
  String toLaTeX() {
    // Filter the bullets based on whether isChecked is true
    List<Bullet> checkedBullets =
        bullets.where((bullet) => bullet.isChecked).toList();

    // Generate the LaTeX code for each checked bullet using Bullet's toLaTeX method
    String bulletLaTeX =
        checkedBullets.map((bullet) => bullet.toLaTeX()).join('\n');

    return '''
\\resumeProject
  {\\textbf{$title} \$|\$ $title}
  \\resumeBulletListStart
    $bulletLaTeX
  \\resumeBulletListEnd
''';
  }
}
