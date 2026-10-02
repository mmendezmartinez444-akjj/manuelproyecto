import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_tab_bar.dart';
import 'catalog_screen.dart';
import 'favorites_screen.dart';
import 'gallery_screen.dart';
import 'home_screen.dart';
import 'progress_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  void _selectTab(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(onQuickAccess: _selectTab),
      const CatalogScreen(),
      const GalleryScreen(),
      const FavoritesScreen(),
      const ProgressScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: IndexedStack(index: _selectedIndex, children: screens),
      ),
      bottomNavigationBar: AppTabBar(
        currentIndex: _selectedIndex,
        onTap: _selectTab,
      ),
    );
  }
}
