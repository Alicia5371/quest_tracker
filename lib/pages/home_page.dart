import 'package:flutter/material.dart';
import 'package:quest_tracker/models/quest.dart';
import 'package:quest_tracker/pages/add_quest_page.dart';

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
                const SizedBox(height: 4),
                Text(
                  '$totalXP XP',
                  style: const TextStyle(
                    fontFamily: 'PixelFont',
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: quests.length,
              itemBuilder: (context, index) {
                final quest = quests[index];
                return Card(
                  color: const Color(0xFF2C3E50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      quest.title,
                      style: const TextStyle(
                        fontFamily: 'PixelFont',
                        fontSize: 18,
                        color: Color(0xFFEAEAEA),
                      ),
                    ),
                    trailing: Icon(
                      quest.completed
                          ? Icons.check_circle
                          : Icons.circle_outlined,
                      color: quest.completed ? Colors.green : Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                        quest.completed = !quest.completed;
                        totalXP = calculateTotalXP();
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddQuestPage(
                onAddQuest: (newQuest) {
                  setState(() {
                    quests.add(newQuest);
                    totalXP = calculateTotalXP();
                  });
                },
              ),
            ),
          );
        },
        backgroundColor: const Color(0xFFFFC857),
        child: const Icon(Icons.add, color: Colors.black, size: 35),
      ),
    );
  }
}
