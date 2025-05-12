import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String btnName;
  const MyButton({super.key, required this.btnName,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onTap,
    color: Theme.of(context).primaryColor,
    child: Text(btnName),);
  }
}
