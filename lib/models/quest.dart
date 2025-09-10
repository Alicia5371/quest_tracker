class Quest {
  String id;
  String title;
  String description;
  int xp;
  String difficulty;
  bool completed;

  Quest({
    required this.id,
    required this.title,
    this.description = '',
    this.xp = 10,
    this.difficulty = 'easy',
    this.completed = false,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'xp': xp,
    'difficulty': difficulty,
    'completed': completed,
  };

  factory Quest.fromMap(Map<String, dynamic> map) => Quest(
    id: map['id'],
    title: map['title'],
    description: map['description'] ?? '',
    xp: map['xp'] ?? 10,
    difficulty: map['difficulty'] ?? 'easy',
    completed: map['completed'] ?? false,
  );
}
