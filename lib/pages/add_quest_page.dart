import 'package:flutter/material.dart';
import '../models/quest.dart';

class AddQuestPage extends StatefulWidget {
  final Function(Quest) onAddQuest; // Callback to pass new quest back

  const AddQuestPage({super.key, required this.onAddQuest});

  @override
  State<AddQuestPage> createState() => _AddQuestPageState();
}

class _AddQuestPageState extends State<AddQuestPage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  int xp = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text(
          'Add Task',
          style: TextStyle(
            fontFamily: 'PixelFont',
            fontSize: 24,
            color: Color(0xFFEAEAEA),
          ),
        ),
        backgroundColor: const Color(0xFF1B2A41),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Title
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'PixelFont',
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'Task Title',
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task title';
                  }
                  return null;
                },
                onSaved: (value) {
                  title = value!;
                },
              ),
              const SizedBox(height: 16),

              // Description
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'PixelFont',
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'Description (optional)',
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  description = value ?? '';
                },
              ),
              const SizedBox(height: 16),

              // XP
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'PixelFont',
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  labelText: 'XP (default 10)',
                  labelStyle: TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  xp = int.tryParse(value ?? '10') ?? 10;
                },
              ),
              const SizedBox(height: 16),

              const SizedBox(height: 24),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Create new Quest object
                    final newQuest = Quest(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: title,
                      description: description,
                      xp: xp,
                      completed: false,
                    );

                    // Pass back to HomePage
                    widget.onAddQuest(newQuest);
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC857),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 16,
                  ),
                ),
                child: const Text(
                  'Add Task',
                  style: TextStyle(
                    fontFamily: 'PixelFont',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
