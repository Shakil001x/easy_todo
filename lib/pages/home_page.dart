import 'package:easy_todo/component/my_list_view.dart';
import 'package:easy_todo/data/database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../component/my_alert_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//reference the hive box
final _myBox=Hive.box('mybox');


  ToDoDataBase db=ToDoDataBase();

  @override
  void initState() {
    // if this app 1st time opening, then crate default
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      //already exists data
      db.loadData();
    }

    super.initState();
  }

    void onSaveTask(){
      setState(() {
        db.todoList.add([_inputController.text,false]);
        Navigator.of(context).pop();
        _inputController.clear();
      });

    }

  final _inputController=TextEditingController();
  void createTask (){
    showDialog(context: context, builder: (_){
      return MyAlertDialog(
        controller: _inputController,
        onSave: onSaveTask,
       );
    });
    db.upDateDataBase();
  }

  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.todoList[index][1]=!db.todoList[index][1];
    });
    db.upDateDataBase();
  }
    void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.upDateDataBase();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('TO DO'),
        centerTitle: true,

      )
      , body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return MyListView(
            title: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value )=>checkBoxChanged(value,index),
            deleteTask: (context)=>deleteTask(index));


        }), floatingActionButton:
    FloatingActionButton(onPressed: createTask,
    backgroundColor: Colors.yellow,
    shape: CircleBorder(),
    child: Icon(Icons.add,color: Colors.black,size: 30,),)

      ,);
  }

}


