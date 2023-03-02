import 'package:hive/hive.dart';

class ToDoDatabase{
List toDoList=[];
 final _mybox =Hive.box('mybox');
 void creatInitialData(){
   toDoList=[
     ["Make Tutorial",false],
     ["Do Exercise",false],
   ];
 }
 void loadData(){
toDoList= _mybox.get("TODOLIST");
 }
 void updateDatabase(){
_mybox.put("TODOLIST", toDoList);
 }
//
// void deleteTask(int index) {
//
//     _mybox.delete(index);
//
// }
}