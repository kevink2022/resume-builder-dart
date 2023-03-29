import 'checkable.dart';
import 'bullet.dart';

abstract class Component with Checkable {
  final String title;
  final List<Bullet> bullets;

  Component({
    required this.title,
    required this.bullets,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson() is not implemented for base class');
  }
}
