import 'package:flutter/material.dart';
import 'package:selca/pages/curriculum_page.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // onTap:
      // () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => CurriculumScreen()),
      //   );
      // };
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE8E2D2),
      ),
      body: Container(
        height: 1200,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "/Users/keyshiagabriel/SELCA/lib/assets/article_bg.png"),
              fit: BoxFit.cover),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          selectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFFE8E2D2),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.rocket, color: Colors.black),
              label: 'Game Launcher',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Colors.black),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurriculumScreen()),
              );
            });
          }),
    );
  }
}
