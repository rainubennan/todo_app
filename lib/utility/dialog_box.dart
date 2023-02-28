 import 'package:flutter/material.dart';
import 'package:todo_app/utility/my_button.dart';

class Dialog_Box extends StatelessWidget {
 final controller;
 VoidCallback onSave;
 VoidCallback onCancel;
    Dialog_Box({Key? key,
     required this.controller,
     required this.onSave,
   required this.onCancel}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return AlertDialog(
       backgroundColor: Colors.yellow[200],
       content: Container(
         height: 120,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             TextField(
               controller: controller,
               decoration: InputDecoration(
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10)
                 ),
                 hintText: "Add new task"
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 MyButton(text: "Cancel", onPressed: onCancel),
                 SizedBox(width: 10,),
                 MyButton(text: "Save", onPressed: onSave)
               ],
             )

           ],
         ),
       )
     );
   }
 }
