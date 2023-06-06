class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoText: "walking thorough the moon ", isDone: true),
      Todo(id: '02', todoText: "sleep", isDone: false),
      Todo(id: '03', todoText: "walking thorough the moon ", isDone: true),
      Todo(id: '04', todoText: "playing games ", isDone: true),
      Todo(id: '05', todoText: "wreading for final", ),
    ];
  }
}
