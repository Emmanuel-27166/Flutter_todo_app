class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  // String? dateStart;
  // String? dateEnd;
  // String? timeStart;
  // String? timeEnd;
  String? day;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    // required this.dateStart,
    // required this.dateEnd,
    // required this.timeStart,
    // required this.timeEnd,
    required this.day,
  });

  // ARRAY OF TO DO LIST
  static List<ToDo> todoList() {
    return [
      ToDo(
          id: '1',
          todoText: 'Clean the house',
          isDone: true,
          // dateStart: '2024-10-12',
          // dateEnd: '2024-10-31',
          // timeStart: '09:00 Am',
          // timeEnd: '10:00 Am',
          day: 'Monday'),
      // ToDo(
      //     id: '2',
      //     todoText: 'Buy groceries',git
      //     isDone: true,
      //     // dateStart: '2024-10-13',
      //     // dateEnd: '2024-10-28',
      //     // timeStart: '08:00 Am',
      //     // timeEnd: '11:00 Am',
      //     day: 'Tuesday'),
      // ToDo(
      //     id: '3',
      //     todoText: 'Workout',
      //     isDone: false,
      //     // dateStart: '2024-10-14',
      //     // dateEnd: '2024-10-31',
      //     // timeStart: '09:00 Am',
      //     // timeEnd: '12:00 Am',
      //     day: 'Wednesday'),
      // ToDo(
      //     id: '3',
      //     todoText: 'Workout',
      //     isDone: false,
      //     // dateStart: '2024-10-14',
      //     // dateEnd: '2024-10-31',
      //     // timeStart: '09:00 Am',
      //     // timeEnd: '12:00 Am',
      //     day: 'Wednesday'),
      // // ToDo(
      //     id: '3',
      //     todoText: 'Workout',
      //     isDone: false,
      //     // dateStart: '2024-10-14',
      //     // dateEnd: '2024-10-31',
      //     // timeStart: '09:00 Am',
      //     // timeEnd: '12:00 Am',
      //     day: 'Wednesday'),
      
      // ToDo(
      //     id: '3',
      //     todoText: 'Workout',
      //     isDone: false,
      //     // dateStart: '2024-10-14',
      //     // dateEnd: '2024-10-31',
      //     // timeStart: '09:00 Am',
      //     // timeEnd: '12:00 Am',
      //     day: 'Wednesday'),
    
    
    ];
  }
}
