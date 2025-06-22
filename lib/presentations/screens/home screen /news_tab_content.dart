import 'package:flutter/material.dart';

class NewsFeedContent extends StatelessWidget {
  const NewsFeedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, -1),
            child: Row(
              children: [
                Text('row skrolable'),
                SizedBox(width: 12),
                Text('clanci blogovi linkovi'),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [Text('statusi i reklame partnera')],
            ),
          ),
        ],
      ),
    );
  }
}
