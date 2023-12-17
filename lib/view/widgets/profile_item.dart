import 'package:attendee/view/widgets/heading_text.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title, value;

  const ProfileItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
              child: Text(
            value,
            maxLines: 100,
          )),
        ],
      ),
    );
  }
}
