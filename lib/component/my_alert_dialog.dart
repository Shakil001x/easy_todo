import 'package:flutter/material.dart';

import 'my_button.dart';

class MyAlertDialog extends StatelessWidget {
  final controller;
  VoidCallback onSave;

   MyAlertDialog({super.key,required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      actions: [
        MyButton(btnName: 'Save',
          onTap: onSave,),
        SizedBox(width: 10,),
        MyButton(btnName: 'Cancel',
          onTap: () {
          Navigator.of(context).pop();
          },),
      ],
      content:Container(
        height: 100,
        child: Column(children: [
          SizedBox(height: 20,),
          TextField(controller: controller,

          decoration: InputDecoration(
              hintText: 'Add a new task',
              border: OutlineInputBorder()),),
        ],),
      ),
    );
  }
}
