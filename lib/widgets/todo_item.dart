import 'package:flutter/material.dart';
import 'package:task/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onTodoChanged;
  final onDeleteItem;
  const TodoItem({
    Key? key,
    required this.todo,
    required this.onDeleteItem,
    required this.onTodoChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 23, left: 6, right: 6),
      child: ListTile(
        onTap: () => {onTodoChanged(todo)},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          // decoration: BoxDecoration(
          //   // color: Colors.red,
          //   borderRadius: BorderRadius.circular(6),
          // ),
          child: IconButton(
            color: Colors.white,
            iconSize: 20,
            onPressed: () {
              debugPrint("delete");
              onDeleteItem(todo.id);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
