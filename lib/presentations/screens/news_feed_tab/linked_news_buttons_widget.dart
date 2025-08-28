import 'package:flutter/material.dart';

class LinkedNewsButtonsWidget extends StatelessWidget {
  const LinkedNewsButtonsWidget({super.key});

  //TODO: implement this / klikom se ulazi na sajt

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
            label: const Text('BLOG'),
            icon: const Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('VIJESTI'),
            icon: const Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('SAJT 1'),
            icon: const Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('SAJT 2'),
            icon: const Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('SAJT 3'),
            icon: const Icon(Icons.abc),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: const Text('SAJT 4'),
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}
