import 'package:flutter/material.dart';
import 'package:hobby/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hobby/screens/home_screen.dart';
import 'package:hobby/screens/categories.dart';
import 'package:hobby/screens/cart.dart';
import 'package:hobby/screens/user.dart';


class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List _pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const UserScreen()
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark
            ? Theme.of(context).cardColor
            : Colors.white,
        type: BottomNavigationBarType.fixed,//shifted!
        showSelectedLabels: false,//NO label on selected!
        showUnselectedLabels: false,//NO lebel on unselected!
        currentIndex: _selectedIndex,
        unselectedItemColor: _isDark
            ? Colors.white10
            : Colors.black12,
        selectedItemColor: _isDark
            ? Colors.lightBlue.shade200
            : Colors.black87,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:
              Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon:
              Icon(_selectedIndex == 1 ? IconlyBold.category : IconlyLight.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon:
              Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon:
              Icon(_selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
            label: "User",
          ),
        ],),
    );
  }
}
