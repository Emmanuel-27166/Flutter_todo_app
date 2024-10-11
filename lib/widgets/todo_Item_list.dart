import 'package:flutter/material.dart';
import 'package:todo_app/custom_colors/colors.dart';
import 'package:todo_app/model/todo_model.dart';

class ToDoItem extends StatelessWidget {
  // create a variable and called it to do
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;   
  const ToDoItem(
      {super.key,
      required this.todo,
      required this.onDeleteItem,
      required this.onToDoChanged
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        onTap: () {
          //   print("clicked me");
          onToDoChanged(todo);
        },
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        subtitle: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(todo.day!.toUpperCase()),
              Text(
                "Start:",
                style: TextStyle(color: tdGrey),
              ),
              Text(
                // todo.timeStart!,
                "12:Am",
                style: TextStyle(color: tdGrey),
              ),
              Text(
                "End:",
                style: TextStyle(color: tdGrey),
              ),
              Text(
                // todo.timeEnd!,
                '12 :am',
                style: TextStyle(color: tdGrey),
              ),
            ],
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 7),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            onPressed: () {
              //   print("delete Items");
              onDeleteItem(todo.id);
            },
            icon: const Icon(Icons.delete),
            iconSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
