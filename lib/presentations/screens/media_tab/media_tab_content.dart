import 'package:flutter/material.dart';

class MediaTabContent extends StatelessWidget {
  const MediaTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, -1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('add post button, + icon')],
            ),
          ),
          Align(
            alignment: Alignment(-0.9, -0.8),
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [Text('POSTS')],
            ),
          ),
        ],
      ),
    );
  }
}
