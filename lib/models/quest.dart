class Quest {
  String id;
  String title;
  String description;
  int xp;
  //String difficulty;
  bool completed;

  Quest({
    required this.id,
    required this.title,
    this.description = '',
    this.xp = 10,
    //this.difficulty = 'easy',
    this.completed = false,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'xp': xp,
    //'difficulty': difficulty,
    'completed': completed,
  };
}
