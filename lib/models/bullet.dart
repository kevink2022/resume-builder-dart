import 'checkable.dart';

class Bullet with Checkable {
  final String content;

  Bullet({required this.content});

  factory Bullet.fromJson(Map<String, dynamic> json) {
    return Bullet(content: json['content']);
  }

  Map<String, dynamic> toJson() => {
        'content': content,
      };

  String toLaTeX() {
    return '\\resumeBullet{$content}';
  }
}
