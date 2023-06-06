import 'package:flutter/material.dart';
import 'package:task/model/todo.dart';
import 'package:task/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todolist = Todo.todoList();
  List<Todo> foudTodo = [];
  final todoContoller = TextEditingController();
  @override
  void initState() {
    foudTodo = todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 195, 195),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 68, 54),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                _showAlertDialog(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Text("menu button"),
                //   ),
                // );
              },
              icon: const Icon(Icons.menu),
            ),
            const Text(
              "My Tasks",
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(
              height: 48,
              width: 48,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset('assets/images/mamaye.jpg'),

                // child: Image.network('https://drive.google.com/file/d/1GzlOSWd9IG8MfHQwp6LmhVUzPeCOjbx9/view?usp=sharing'),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 32),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 50, bottom: 20, left: 10),
                        child: const Text(
                          'All Todo',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 11, 68, 54),
                          ),
                        ),
                      ),
                      for (Todo todoo in foudTodo)
                        TodoItem(
                          todo: todoo,
                          onTodoChanged: handleTodoChange,
                          onDeleteItem: deleteItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 23,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            blurRadius: 20,
                            spreadRadius: 0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: todoContoller,
                      decoration: const InputDecoration(
                          hintText: 'Add Task',
                          border: InputBorder.none,
                          fillColor: Color.fromARGB(255, 11, 68, 54)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      addTodoItem(todoContoller.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(40, 40),
                        elevation: 10),
                    // child: const Text(
                    //   "+",
                    //   style: TextStyle(
                    //     fontSize: 50,
                    //   ),
                    // ),
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      margin: const EdgeInsets.all(23),
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: TextField(
        onChanged: (value) => searchedItem(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(5),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search Tasks',
          hintStyle: TextStyle(color: Color.fromARGB(255, 11, 68, 54)),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text(
            "YO Don't fucking press me ! i am on working eko man ",
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void deleteItem(String id) {
    setState(() {
      todolist.removeWhere((element) => element.id == id);
    });
  }

  void addTodoItem(String todo) {
    setState(() {
      todolist.add(
        Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo,
        ),
      );
    });
    todoContoller.clear();
  }

  void searchedItem(String entryKeyBoard) {
    List<Todo> results = [];
    if (entryKeyBoard.isEmpty) {
      results = todolist;
    } else {
      results = todolist
          .where((element) => element.todoText!
              .toLowerCase()
              .contains(entryKeyBoard.toLowerCase()))
          .toList();
    }
    setState(() {
      foudTodo = results;
    });
  }
}
