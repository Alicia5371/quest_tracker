import 'package:flutter/material.dart';
import 'package:quest_tracker/models/quest.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Quest> quests = [
    Quest(id: '1', title: 'Finish homework', xp: 10),
    Quest(id: '2', title: 'Clean your room', xp: 10),
    Quest(id: '3', title: 'Exercise for 30 minutes', xp: 10),
  ];

  int totalXP = 0;

  @override
  void initState() {
    super.initState();
    totalXP = calculateTotalXP();
  }

  int calculateTotalXP() {
    int xp = 0;
    for (var quest in quests) {
      if (quest.completed) xp += quest.xp;
    }
    return xp;
  }

  int calculateLevel() {
    return (totalXP / 50).floor() + 1; //* 50 XP per level
  }

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
      body: Column(
        children: [
          //! XP Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Level ${calculateLevel()}',
                  style: const TextStyle(
                    fontFamily: 'PixelFont',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                //! Progression Bar
                LinearProgressIndicator(
                  value: (totalXP % 50) / 50, //* XP Progress toward next level
                  color: Colors.amber,
                  backgroundColor: Colors.grey[700],
                  minHeight: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
