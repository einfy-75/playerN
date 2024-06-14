import 'package:flutter/material.dart';
import 'package:nyimbo_player/pages/homeScreen.dart';
import 'package:iconsax/iconsax.dart';
import 'pages/libraryScreen.dart';
import 'pages/searchScreen.dart';
import 'pages/widgets/currentSong.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'music-player',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber[800]),
      ),
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _widgetOptions.elementAt(_selectedIndex),
          BottomSheetPlayer(songName: 'Current Song', artistName: 'Artist',iconData: Iconsax.music ,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(65, 0, 0, 0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? Iconsax.home_15 : Iconsax.home,
              color: _selectedIndex == 0 ? Colors.white : Colors.white54,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? Iconsax.search_favorite : Iconsax.search_normal,
              color: _selectedIndex == 1 ? Colors.white : Colors.white54,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2 ? Iconsax.color_swatch : Iconsax.fatrows,
              color: _selectedIndex == 2 ? Colors.white : Colors.white54,
            ),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: _onItemTapped,
      ),
    );
  }
}
