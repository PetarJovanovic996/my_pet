import 'package:flutter/material.dart';

class PartnersPromotedPostsWidget extends StatelessWidget {
  const PartnersPromotedPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 40,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Partner ${index + 1} i am promoting, promoted posts, reklame',
            maxLines: 2,
            style: const TextStyle(fontSize: 22),
          ),
        );
      },
    );
  }
}
