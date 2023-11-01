import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../Repositories/Promotions/PromotionsRepo.dart';
import '../../model/GoalPointsResponse.dart';
import '../../model/GoalsRewardsResponse.dart';

class GoalAndRewardsController extends GetxController{
  final apiClient = PromotionRepo();
  bool isLoading = false;
  GoalsRewardsResponse model = GoalsRewardsResponse();
  GoalPointsResponse goalPointsResponse = GoalPointsResponse();
  Future<dynamic> getGoals() async {
    isLoading = true;
    await apiClient.getGoals().then((response) async {
      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          model = GoalsRewardsResponse.fromJson(json.decode(response));
        } else {
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){
        debugPrint("Response is null");
      }
      else{
        debugPrint("Don't know what happened");
      }
    });
    isLoading = false;
    update();
  }
  Future<dynamic> getGoalsPoints() async {
    isLoading = true;
    await apiClient.getPoints().then((response) async {

      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          goalPointsResponse = GoalPointsResponse.fromJson(json.decode(response));
        } else {
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){
        debugPrint("Response is null");
      }
      else{
        debugPrint("Don't know what happened");
      }
    });
    isLoading = false;
    update();
  }
}