
import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import 'recipe_page.dart';
import 'inventory_page.dart';
import 'tracker_page.dart';
<<<<<<< HEAD
import 'authentication_page.dart';
=======
>>>>>>> origin/main

class HomeShellPage extends StatefulWidget {
  const HomeShellPage({super.key});

  @override
  State<HomeShellPage> createState() => _HomeShellPageState();
}

class _HomeShellPageState extends State<HomeShellPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    RecipePage(),
    BookmarkPage(),
    InventoryPage(),
    TrackerPage(),
<<<<<<< HEAD
    Center(
      child: Text('Halaman Modul Lain (Dummy / Placeholder)'),
    ),
    const AuthenticationPage(),
=======
    Center(child: Text('Halaman Modul Lain (Dummy / Placeholder)')),
>>>>>>> origin/main
  ];

  final List<String> _titles = const [
    'OlahRasa - Recipes',
    'OlahRasa - Bookmark',
    'OlahRasa - Inventory',
    'OlahRasa - Tracker',
    'OlahRasa - Modul Lain',
    'OlahRasa - Authentication',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
<<<<<<< HEAD
            icon: Icon(Icons.track_changes),
=======
            icon: Icon(Icons.inventory),
>>>>>>> origin/main
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Lainnya',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
