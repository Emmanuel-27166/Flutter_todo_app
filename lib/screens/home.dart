import 'package:flutter/material.dart';
import 'package:todo_app/custom_colors/colors.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/todo_Item_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Here we create variables to render the TodList items
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _searchToDoList = [];
  String? _erroMessage;

  @override
  void initState() {
    // TODO: implement initState
    _searchToDoList = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 20,
        title: const Text(
          "My Daily Activity List",
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),

        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     // Icon(
        //     //   Icons.menu,
        //     //   color: tdBlack,
        //     //   size: 30,
        //     // ),

        //     SizedBox(
        //       height: 40,
        //       width: 40,
        //     ),
        //     //   child: ClipRRect(
        //     //     borderRadius: BorderRadius.circular(20),
        //     //     child: Image.asset('assets/avatar.png'),
        //     //   ),
        //     // )
        //   ],
        // ),
      ),
      // Here we add our drawer
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Unique & Bah",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text("team@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.view_agenda),
              title: const Text("All Task"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                // the Search box widgets
                SearchBox(),

                // the ListView Items
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          'All your Task Lists',
                          style: TextStyle(
                              // color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0),
                        ),
                      ),
                      // ================tO DO LIST ITEMS=====Import===
                      // here we pass a for loop to get the todo list items
                      for (ToDo todoActivite in _searchToDoList.reversed)
                        ToDoItem(
                          todo: todoActivite,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),

          //  ======================FOR THE ADD TASK =================
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller:
                        _todoController, //here we pass the textEditing controller
                    decoration: const InputDecoration(
                      hintText: "Add new Task",
                      border: InputBorder.none,
                    ),
                  ),
                )),

                // ===================the Add Task Btn =================
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDOItem(_todoController.text, _todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

// ================the todo Change handler =================
  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo
          .isDone; // here if the todo is done it will set to true else set to false
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((item) =>
          item.id ==
          id); //here if the item matches with the id then it will remove
    });
  }

  void _addToDOItem(String toDo, day) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
          // timeStart: TimePicker,
          // timeEnd: TimePickerTheme,
          day: day));
      if (_todoController.text.isEmpty) {
        _erroMessage = "Please Input a Task";
      }
    });
    _todoController.clear();
  }

  // search to do function
  void _runFilter(enteredKeyWord) {
    List<ToDo> result = [];
    if (enteredKeyWord.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyWord.toLowerCase()))
          .toList();
    }

    setState(() {
      _searchToDoList = result;
    });
  }

  // the SearcBox widget
  Widget SearchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: tdBlack,
          ),
          prefixIconConstraints: const BoxConstraints(
            maxWidth: 20,
            minHeight: 20,
          ),
          border: InputBorder.none,
          hintText: "Search for your Task",
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}
