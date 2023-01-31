import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_golang_yt/routes/routes.dart';
import 'package:flutter_golang_yt/utils/app_colors.dart';
import 'package:flutter_golang_yt/screens/add_task.dart';
import 'package:flutter_golang_yt/screens/all_tasks.dart';
import 'package:flutter_golang_yt/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
              text: "Hi there!",
              style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            )),
            RichText(
                text: TextSpan(
                    text: "Start your day with Bismillah!",
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 15,
                    ))),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
            ),
            InkWell(
              onTap: () {
                Get.to(() => AddTask(),
                    transition: Transition.zoom,
                    duration: Duration(milliseconds: 500));
              },
              child: ButtonWidget(
                  backgroundcolor: AppColors.mainColor,
                  text: "Add Task",
                  textColor: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(RoutesClass.getAllTasksRoute());
              },
              child: ButtonWidget(
                  backgroundcolor: Colors.white,
                  text: "View All",
                  textColor: AppColors.smallTextColor),
            )
          ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/welcome.jpg"))),
      ),
    );
  }
}
