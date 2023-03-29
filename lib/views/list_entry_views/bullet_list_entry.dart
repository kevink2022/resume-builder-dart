import 'package:flutter/material.dart';
import 'package:resume_builder/models/bullet.dart';

class BulletListEntry extends StatelessWidget {
  final Bullet bullet;
  final ValueChanged<bool?>? onBulletToggle;

  BulletListEntry({required this.bullet, this.onBulletToggle});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        bullet.content,
        style: const TextStyle(fontSize: 14),
      ),
      value: bullet.isChecked,
      onChanged: (bool? newValue) {
        bullet.isChecked = newValue ?? false;
        if (onBulletToggle != null) {
          onBulletToggle!(newValue);
        }
      },
    );
  }
}
