import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyListView extends StatelessWidget {
  final String title;
  final bool taskCompleted;
  void Function(bool?)? onChanged;
  void Function(BuildContext) deleteTask;
  MyListView({super.key, required this.title, required this.taskCompleted
  ,required this.onChanged,required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24,right: 24,top: 24),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children:[
              SlidableAction(
                onPressed:deleteTask,
                icon:Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
               )
            ]),
        child: Container(
          decoration: BoxDecoration(color: Colors.yellow,
          borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              Checkbox(value: taskCompleted,
                  onChanged:onChanged),
              Text(title,

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  decoration:taskCompleted? TextDecoration.lineThrough:TextDecoration.none,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
