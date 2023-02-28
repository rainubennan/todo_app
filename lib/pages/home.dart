import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utility/dialog_box.dart';
import '../utility/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _myBox =Hive.box('mybox');
  ToDoDatabase db =ToDoDatabase();

  @override
  void initState(){
    if (_myBox.get("TODOLIST")== null){
      db.creatInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  final _controller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(title: Text('To Do'),
      elevation: 0,),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>
        creatNewtask(),

      child: Icon(Icons.add),),
      body: ListView.builder(
          itemCount:  db.toDoList.length        ,
          itemBuilder: (context,index){
            return ToDoTile(
                taskName: db.toDoList[index][0],
                taskComplete: db.toDoList[index][1],
                onChanged: (value)=> checkBoxChanged(value,index),
              deleteFunction: (context) =>  deleteTask(index)
            );
          })
    );
  }

  checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1]= !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  creatNewtask() {
    showDialog(
        context: context,
        builder: (context){
      return Dialog_Box(
             controller: _controller,
        onSave:saveNewTask,
         onCancel: () =>Navigator.of(context).pop(),
      );

        });
  }
  void saveNewTask(){
    setState(() {
      db.toDoList.add(([_controller.text,false]));
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }
}
