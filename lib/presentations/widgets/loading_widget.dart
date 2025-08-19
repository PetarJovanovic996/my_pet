import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color:
          Theme.of(context).brightness == Brightness.light
              ? color
              : Colors.white,
    );
  }
}
