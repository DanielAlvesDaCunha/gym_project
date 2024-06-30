import 'package:flutter/material.dart';
import 'nav_bar_settings.dart';



void main() {
  final searchController = SearchController();
  runApp(FitnessApp(searchController: searchController));
}

class FitnessApp extends StatelessWidget {
  final SearchController searchController;

  const FitnessApp({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavBar(searchController: searchController),
      theme: ThemeData(
        canvasColor: Colors.green,
        primaryColor: Colors.blue,
        hintColor: Colors.green,
      ),
    );
  }
}