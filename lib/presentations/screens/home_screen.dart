import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pet/core/locator.dart';
import 'package:my_pet/presentations/screens/explore_tab/explore_tab_content.dart';
import 'package:my_pet/presentations/screens/media_tab/media_tab_content.dart';
import 'package:my_pet/presentations/screens/news_feed_tab/news_tab_content.dart';
import 'package:my_pet/presentations/screens/profile_tab/profile_tab_content.dart';
import 'package:my_pet/presentations/widgets/main_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTabSelected(int index, BuildContext context) {
    if (index == 0) {}
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getAppBarTitle(BuildContext context) {
    final user = context.read<AuthenticationRepository>().currentUser;

    switch (_selectedIndex) {
      case 0:
        return translations.newsFeedAppBarTitle;
      case 1:
        return translations.exploreppBarTitle;
      case 2:
        return translations.mediappBarTitle;
      case 3:
        return '${translations.hello} ${user.name!.toUpperCase()}';
      default:
        return translations.newsFeedAppBarTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: _getAppBarTitle(context)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: _tabContent(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor.withAlpha(180),
        selectedItemColor: Theme.of(context).scaffoldBackgroundColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => _onTabSelected(index, context),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.newspaper),
            label: translations.newsFeed,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore),
            label: translations.explore,
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.newspaper),
            label: translations.media,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_pin_circle_rounded),
            label: translations.profile,
          ),
        ],
      ),
    );
  }
}

Widget _tabContent(int index) {
  switch (index) {
    case 0:
      return const NewsFeedContent();
    case 1:
      return const ExloreTabContent();
    case 2:
      return const MediaTabContent();
    case 3:
      return const ProfileTabContent();

    default:
      return const NewsFeedContent();
  }
}
