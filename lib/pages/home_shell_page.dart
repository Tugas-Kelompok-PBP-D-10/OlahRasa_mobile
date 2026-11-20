import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import 'recipe_page.dart';
import 'inventory_page.dart';

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
    Center(child: Text('Halaman Modul Lain (Dummy / Placeholder)')),
  ];

  final List<String> _titles = const [
    'OlahRasa - Recipes',
    'OlahRasa - Bookmark',
    'OlahRasa - Inventory',
    'OlahRasa - Modul Lain',
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
            icon: Icon(Icons.grid_view),
            label: 'Lainnya',
          ),
        ],
      ),
    );
  }
}