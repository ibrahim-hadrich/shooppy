import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialogue extends StatelessWidget {
final String? message;
ErrorDialogue({this.message});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key:key,
      content:Text(message!) ,
      actions: [
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        },
            child: const Center(
              child: Text('OK'),
            ),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
        )
      ],
    );
  }
}
