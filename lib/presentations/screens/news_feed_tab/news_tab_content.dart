import 'package:flutter/material.dart';
import 'package:my_pet/gen/assets.gen.dart';
import 'package:my_pet/presentations/screens/news_feed_tab/linked_news_buttons_widget.dart';
import 'package:my_pet/presentations/screens/news_feed_tab/partners_promoted_posts_widget.dart';

class NewsFeedContent extends StatelessWidget {
  const NewsFeedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        spacing: 24,
        children: [
          const LinkedNewsButtonsWidget(),
          Image.asset(Assets.images.animePetPic.path, height: 160),
          const Expanded(child: PartnersPromotedPostsWidget()),
        ],
      ),
    );
  }
}
