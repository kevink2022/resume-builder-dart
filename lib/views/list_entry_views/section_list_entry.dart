import 'package:flutter/material.dart';
import 'package:resume_builder/models/section.dart';

class SectionListEntry extends StatefulWidget {
  final Section section;
  final ValueChanged<bool?>? onSectionToggle;

  SectionListEntry({required this.section, this.onSectionToggle});

  @override
  _SectionListEntryState createState() => _SectionListEntryState();
}

class _SectionListEntryState extends State<SectionListEntry> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.section.title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      value: widget.section.isChecked,
      onChanged: (bool? value) {
        setState(() {
          widget.section.isChecked = value!;
        });
        if (widget.onSectionToggle != null) {
          widget.onSectionToggle!(value);
        }
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:resume_builder/models/section.dart';

// class SectionListEntry extends StatelessWidget {
//   final Section section;

//   SectionListEntry({required this.section});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       section.title,
//       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
//     );
//   }
// }
