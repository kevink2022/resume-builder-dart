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
        print('Bullet isChecked before: ${bullet.isChecked}');
        bullet.isChecked = newValue ?? false;
        print('Bullet isChecked after: ${bullet.isChecked}');

        if (onBulletToggle != null) {
          onBulletToggle!(newValue);
        }
      },
    );
  }
}
