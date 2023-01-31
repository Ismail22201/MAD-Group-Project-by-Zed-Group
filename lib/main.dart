import 'package:flutter/material.dart';
import 'package:flutter_golang_yt/controllers/data_controller.dart';
import 'package:flutter_golang_yt/routes/routes.dart';
import 'package:flutter_golang_yt/screens/add_task.dart';
import 'package:flutter_golang_yt/screens/all_tasks.dart';
import 'package:flutter_golang_yt/screens/home_screen.dart';
import 'package:flutter_golang_yt/screens/edit_task.dart';
import 'package:flutter_golang_yt/screens/view_task.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const EditTask(),
      initialRoute: RoutesClass.getHomeRoute(),
      getPages: RoutesClass.routes,
    );
  }
}
