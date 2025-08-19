import 'package:flutter/material.dart';

class LinkedNewsButtonsWidget extends StatelessWidget {
  const LinkedNewsButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 12,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('BLOG'),
            icon: Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('VIJESTI'),
            icon: Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('SAJT 1'),
            icon: Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('SAJT 2'),
            icon: Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('SAJT 3'),
            icon: Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text('SAJT 4'),
            icon: Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}
