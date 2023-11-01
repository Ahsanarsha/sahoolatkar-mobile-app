import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saholatkar/model/product_model/SearchModelResponse.dart';

import '../../Repositories/AllData/all_data_repo.dart';
import '../../model/product_model/FavProducts.dart';

class SearchController extends GetxController{
  bool isLoading = false;
  SearchModelResponse searchModelResponse = SearchModelResponse();
  FavProducts favProducts = FavProducts();
  List<int> qty = [];
  final brandClient = AllDataRepo();
  incrementQuantity(int index){
    qty[index]++;
    update();
  }
  decrementQuantity(int index){
    qty[index]--;
    update();
  }

  Future<dynamic> getSearchDetails(String product) async {


    await brandClient.getSearchProducts(product).then((response) async {
      isLoading = true;
      if (response != null) {
        debugPrint(response.toString());
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          searchModelResponse = SearchModelResponse.fromJson(json.decode(response));
          update();
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
  Future<dynamic> getFavProducts() async {
    await brandClient.getFavPro().then((response) async {

      isLoading = true;
      if (response != null) {
        debugPrint(response.toString());
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          favProducts = FavProducts.fromJson(json.decode(response));
          update();
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