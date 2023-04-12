import 'package:flutter/material.dart';
import 'package:resume_builder/models/link.dart';

class LinkListEntry extends StatefulWidget {
  final Link link;
  final ValueChanged<bool?>? onLinkToggle;

  LinkListEntry({required this.link, this.onLinkToggle});

  @override
  _LinkListEntryState createState() => _LinkListEntryState();
}

class _LinkListEntryState extends State<LinkListEntry> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.link.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(widget.link.url),
      value: widget.link.isChecked,
      onChanged: (bool? value) {
        setState(() {
          widget.link.isChecked = value!;
        });
        if (widget.onLinkToggle != null) {
          widget.onLinkToggle!(value);
        }
      },
    );
  }
}
