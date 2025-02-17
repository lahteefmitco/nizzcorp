import 'package:niz_corp/screens/add_task_screen/add_task_screen.dart';
import 'package:niz_corp/screens/added_tasks_screen/added_tasks_screen.dart';
import 'package:niz_corp/screens/home_screen/home_screen.dart';



const home_screen = "/home";
const add_task = "/add_task";
const added_Tasks = "/added_tasks";

final routes = {
  home_screen : (context)=>HomeScreen(),
  add_task : (context)=>AddTaskScreen(),
  added_Tasks : (context)=>AddedTasksScreen(),
};
