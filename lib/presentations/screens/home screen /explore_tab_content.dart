import 'package:flutter/material.dart';

class ExloreTabContent extends StatelessWidget {
  const ExloreTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Align(alignment: Alignment(0, -1), child: Text('MAPA')),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [Text('FORUM')],
            ),
          ),
        ],
      ),
    );
  }
}
