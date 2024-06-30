import 'package:flutter/material.dart';
import 'package:ultima_tentativa/settings_app.dart';
import 'package:ultima_tentativa/weight_progression.dart';

import 'STREAMS/timer/work_timer.dart';
import 'home_page.dart';
import 'training_co.dart';

class NavBar extends StatefulWidget {
  final SearchController searchController;

  const NavBar({super.key, required this.searchController});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

   List<Widget> _widgetOptions(SearchController searchController) => [
    HomePage(),
    TrainingCo(searchController: searchController),
    WeightProgress(),
     TreinoTimer(),
     Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Treinos',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      body: _widgetOptions(widget.searchController).elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.fitness_center),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
            icon: Icon(Icons.network_ping_outlined),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
          icon: Icon(Icons.timer),
          label: 'Timer',
    ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black54,
          icon: Icon(Icons.settings),
          label: 'Settings',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}