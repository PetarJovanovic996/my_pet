import 'package:flutter/material.dart';
import 'package:my_pet/l10n/app_localizations.dart';
import 'package:my_pet/presentations/screens/home%20screen%20/home_tab_content.dart';
import 'package:my_pet/presentations/screens/home%20screen%20/media_tab_content.dart';
import 'package:my_pet/presentations/screens/home%20screen%20/profile_tab_content.dart';
import 'package:my_pet/presentations/screens/home%20screen%20/explore_tab_content.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: AppLocalizations.of(context)!.appName),
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
            label: AppLocalizations.of(context)!.newsFeed,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.explore),
            label: AppLocalizations.of(context)!.explore,
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.newspaper),
            label: AppLocalizations.of(context)!.media,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_pin_circle_rounded),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}

Widget _tabContent(int index) {
  switch (index) {
    case 0:
      return const HomeTabContent();
    case 1:
      return const ExloreTabContent();
    case 2:
      return const MediaTabContent();
    case 3:
      return const ProfileTabContent();

    default:
      return const HomeTabContent();
  }
}
