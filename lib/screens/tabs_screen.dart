import 'package:flutter/material.dart';
import 'package:scrumptious/models/meal.dart';
import 'package:scrumptious/screens/categories_screen.dart';
import 'package:scrumptious/screens/favorites_screen.dart';
import 'package:scrumptious/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorites;
  TabsScreen(this.favorites);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {'page': FavoritesScreen(widget.favorites), 'title': "Your Favorites"},
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                title: Text("Categories")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text("Favorites")),
          ]),
    );
  }
}
