import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_golang_yt/services/service.dart';
import 'package:flutter_golang_yt/utils/app_constants.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Map<String, dynamic> _singleData = {};
  Map<String, dynamic> get singleData => _singleData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_TASKS);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got the data");
    } else {
      print("we did not get any data");
    }
    _isLoading = false;
    update();
  }

  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response =
        await service.getData('${AppConstants.GET_TASK}' '?id=$id');
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("we got the single data" + jsonEncode(response.body));
        _singleData = response.body;
      }
    } else {
      print("we did not get any data");
    }
    _isLoading = false;
    update();
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(
        AppConstants.POST_TASK, {"task_name": task, "task_detail": taskDetail});
    if (response.statusCode == 200) {
      print("data post successful");
    } else {
      print("data post failed");
    }
    update();
  }

  Future<void> updateData(String task, String taskDetail, int id) async {
    _isLoading = true;
    Response response = await service.updateData(
        '${AppConstants.UPDATE_TASK}' '?id=$id',
        {"task_name": task, "task_detail": taskDetail});
    if (response.statusCode == 200) {
      print("data post successful");
    } else {
      print("data post failed");
    }
    update();
  }

  Future<void> deleteData(int id) async {
    _isLoading = true;
    update();
    Response response =
        await service.deleteData('${AppConstants.DELETE_TASK}' '?id=$id');
    if (response.statusCode == 200) {
      print("data post successfully");
    } else {
      print("data post failed");
    }
    await Future.delayed(Duration(seconds: 1), () {
      _isLoading = false;
      update();
    });
  }
}
