import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List todoList=[];
  //refreance the hive box
  final _myBox=Hive.box('mybox');

  //run this method if this is the 1st time opening this app
  void createInitialData(){
    todoList=[
      ['Drink Water',false],
      ['Do Exercise',false],
    ];
  }

  //load the data from databae
void loadData(){

    todoList=_myBox.get("TODOLIST");
}

void upDateDataBase(){
_myBox.put("TODOLIST", todoList);
}
}