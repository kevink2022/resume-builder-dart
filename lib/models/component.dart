abstract class Component {
  final String title;
  final List<String> bullets;

  Component({
    required this.title,
    this.bullets = const [],
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson() is not implemented for base class');
  }
}
