import 'package:flutter/material.dart';
import 'package:quest_tracker/models/quest.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Quest Tracker"),
        backgroundColor: const Color(0xFF1B2A41),
        titleTextStyle: TextStyle(
          fontFamily: 'PixelFont',
          fontSize: 30,
          color: Color(0xFFEAEAEA),
        ),
      ),
    );
  }
}
