import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_golang_yt/routes/routes.dart';
import 'package:flutter_golang_yt/screens/view_task.dart';
import 'package:flutter_golang_yt/screens/edit_task.dart';
import 'package:flutter_golang_yt/utils/app_colors.dart';
import 'package:flutter_golang_yt/controllers/data_controller.dart';
import 'package:flutter_golang_yt/widgets/button_widget.dart';
import 'package:flutter_golang_yt/widgets/task_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);
  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    print(Get.find<DataController>().myData.length);
    _loadData();
    List myData = ["Task 1", "Task 2"];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Color.fromARGB(255, 34, 83, 45).withOpacity(0.5),
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<DataController>(builder: ((controller) {
          return controller.isLoading == false
              ? Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 30),
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back,
                            color: AppColors.secondaryColor),
                      ),
                      width: double.maxFinite,
                      height: MediaQuery.of(context).size.height / 3.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/header1.jpg"))),
                    ),
                    Flexible(
                        child: ListView.builder(
                            itemCount: controller.myData.length,

                            //itemCount: myData.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                background: leftEditIcon,
                                secondaryBackground: rightDeleteIcon,
                                onDismissed: (DismissDirection direction) {
                                  print("after dismiss");
                                },
                                confirmDismiss:
                                    (DismissDirection direction) async {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    showModalBottomSheet(
                                        backgroundColor:
                                            Color.fromARGB(132, 83, 207, 0),
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        builder: (_) {
                                          return Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF2e3253)
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(20),
                                                        topLeft:
                                                            Radius.circular(
                                                                20))),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(RoutesClass
                                                          .getViewTaskRoute(
                                                              controller
                                                                  .myData[index]
                                                                      ["id"]
                                                                  .toString()));
                                                    },
                                                    child: ButtonWidget(
                                                        backgroundcolor:
                                                            AppColors.mainColor,
                                                        text: "View",
                                                        textColor:
                                                            Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(RoutesClass
                                                          .getEditTaskRoute(
                                                              controller
                                                                  .myData[index]
                                                                      ["id"]
                                                                  .toString()));
                                                    },
                                                    child: ButtonWidget(
                                                        backgroundcolor:
                                                            AppColors.mainColor,
                                                        text: "Edit",
                                                        textColor:
                                                            Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                    return false;
                                  } else {
                                    controller.deleteData(
                                        int.parse(controller.singleData["id"]));
                                    return Future.delayed(
                                        const Duration(seconds: 1), () async {
                                      await controller.getData();
                                      return direction ==
                                          DismissDirection.endToStart;
                                    });
                                  }
                                },
                                key: ObjectKey(index),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 10),
                                  child: TaskWidget(
                                    text: controller.myData[index]["task_name"],
                                    //text: myData[index],
                                    color: Color.fromARGB(255, 73, 143, 79),
                                  ),
                                ),
                              );
                            }))
                  ],
                )
              : SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: SpinKitThreeInOut(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: index.isEven ? Colors.red : Colors.green));
                    },
                  ),
                );
        })));
  }
}
