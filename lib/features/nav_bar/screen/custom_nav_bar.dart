import 'package:custom_app/features/nav_bar/provider/nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomNavBar extends ConsumerWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navBarProviderIndex);
    final navbarIndex = ref.read(navBarProviderIndex.notifier);

    final List<Widget> screens = [
      Center(child: Text('Home Screen')),
      Center(child: Text('Search Screen')),
      Center(child: Text('Profile Screen')),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: NavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: (value) => navbarIndex.updateIndex(value),
            indicatorColor: Colors.blue.withValues(alpha: 0.3),
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            labelTextStyle: WidgetStateProperty.resolveWith((state) {
              if (state.contains(WidgetState.selected)) {
                return TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
              }
              return TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              );
            }),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
