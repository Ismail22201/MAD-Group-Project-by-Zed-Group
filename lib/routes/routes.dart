import 'package:flutter_golang_yt/screens/add_task.dart';
import 'package:flutter_golang_yt/screens/all_tasks.dart';
import 'package:flutter_golang_yt/screens/edit_task.dart';
import 'package:flutter_golang_yt/screens/view_task.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';

class RoutesClass {
  static String home = "/";
  static String allTasks = "/allTasks";
  static String addTask = "/addTasks";
  static String editTask = "/addTasks";
  static String viewTask = "/viewTask";

  static String getHomeRoute() => home;
  static String getAllTasksRoute() => allTasks;
  static String getAddTaskRoute() => addTask;
  static String getEditTaskRoute(String id) => '$editTask?id=$id';
  static String getViewTaskRoute(String id) => '$viewTask?id=$id';

  static List<GetPage> routes = [
    GetPage(page: () => const HomeScreen(), name: home),
    GetPage(
        page: () => const AllTasks(),
        name: allTasks,
        transition: Transition.fade,
        transitionDuration: Duration(seconds: 1)),
    GetPage(
        page: () => const AddTask(),
        name: addTask,
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        page: () {
          var id = Get.parameters['id'];
          return EditTask(id: int.parse(id!));
        },
        name: editTask,
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)),
    GetPage(
        page: () {
          var id = Get.parameters['id'];
          return ViewTask(id: int.parse(id!));
        },
        name: viewTask,
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)),
  ];
}
