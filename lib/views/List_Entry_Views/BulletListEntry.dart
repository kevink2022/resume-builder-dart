import 'package:flutter/material.dart';

class BulletListEntry extends StatelessWidget {
  final String bullet;

  BulletListEntry({required this.bullet});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('•  '),
        Expanded(
          child: Text(
            bullet,
            style: const TextStyle(fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}
