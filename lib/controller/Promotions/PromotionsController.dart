import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/Promotions/PromotionsRepo.dart';
import 'package:saholatkar/model/allData/BrandsModel.dart';
import 'package:saholatkar/model/promotion/response/AllPromotionsResponse.dart';
import 'package:saholatkar/model/promotion/response/AllProductsResponse.dart';
import 'package:saholatkar/model/promotion/response/AllProductsResponse.dart' as pro;

import '../../Repositories/AllData/all_data_repo.dart';


class PromotionController extends GetxController{
  bool isLoading = false;
  bool isFilterLoading = false;
  BrandsModel _brand = BrandsModel();
  final ScrollController scrollController = ScrollController();
  bool isLoadMoreRunning = false;
  List<dynamic>? responseList = [];
  bool hasNextPage = true;
  final bool isFirstLoadRunning = false;
  List<int> qty = [];
  int page = 1;
  final apiClient = PromotionRepo();
  final brandClient = AllDataRepo();
  BrandsModel get allBrands => _brand;
  AllPromotionsResponse _promotionResponseModel = AllPromotionsResponse();
  AllProductsResponse allProducts = AllProductsResponse();
  AllPromotionsResponse get allPromotion => _promotionResponseModel;
  bool _isopen = false;

  bool get isopen => _isopen;

  set isopen(bool value) {
    _isopen = value;
    update();
  }

  @override
  void onInit() {
    getBrandDetails();
    getAllPromotions();
    super.onInit();
  }



  incrementQuantity(int index){
    qty[index]++;
    update();
  }
  decrementQuantity(int index){
    qty[index]--;
    update();
  }

  Future<dynamic> getBrandDetails() async {
    debugPrint("fetching all products");
    await brandClient.getBrands().then((response) async {
      print('-------------sssss---------------------');
      isLoading = true;
      if (response != null) {
        debugPrint(response.toString());

        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Successs") {
          _brand = BrandsModel.fromJson(json.decode(response));
          print(_brand.data!.length);

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
    update(['PromotionScreen',true]);
  }


  Future<dynamic> getAllPromotions() async {
    isFilterLoading = true;
    update();
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false) {

    await apiClient.allProducts(page).then((response) async {
      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          responseList=[];
          var body = result['prodcuts']['data'] as List;
          if(body.isNotEmpty){
            allProducts = AllProductsResponse.fromJson(json.decode(response));
            responseList?.addAll(allProducts.prodcuts!.data!);
            isFilterLoading = false;
            print('products length ${allProducts.prodcuts!.data!.length}');
            update();
            page++;
          }else{

            hasNextPage = false;
          }
        } else {
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
    }
    update(['promo','PromotionScreen',true]);
  }


  Future<void> getPromotionsByPrice(num min, num max) async {
    print('${min.toString()} ${max.toString()}');
    isFilterLoading = true;
    update();
    await apiClient.getPromotionByPrice(min,max).then((response) async {
      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          isFilterLoading = false;
          responseList=[];
          _promotionResponseModel = AllPromotionsResponse.fromJson(json.decode(response));
          responseList?.addAll(_promotionResponseModel.data!);
          print('filtered length  ${_promotionResponseModel.data!.length}');
          update(['promo','PromotionScreen',true]);
        } else {responseList=[];

          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){
        responseList=[];
        debugPrint("Response is null");
      }
      else{
        debugPrint("Don't know what happened");
      }
    });
    isFilterLoading = false;
    update(['promo','PromotionScreen',true]);
  }
  String brand = '';
  Future<void> getPromotionsByPriceBrand(num min, num max, brand) async {
    // print('${min.toString().substring(0,min.toString().indexOf('.'))} ${max.toString().substring(0,max.toString().indexOf('.'))}');
    isFilterLoading = true;
    update();
    await apiClient.getPromotionByPriceBrand(min,max,brand).then((response) async {
      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          isFilterLoading = false;
          _promotionResponseModel = AllPromotionsResponse.fromJson(json.decode(response));
          print('filtered brand length $brand ${_promotionResponseModel.data!.length}');
          update(['promo','PromotionScreen',true]);
        } else {

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
    isFilterLoading = false;
    update(['promo','PromotionScreen',true]);
  }

  Future<dynamic> getPromotionsByBrand(String brand) async {
    isLoading = true;
    isFilterLoading = true;
    update();
    await apiClient.getPromotionByBrands(brand).then((response) async {
      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          isFilterLoading = false;
          update();
          _promotionResponseModel = AllPromotionsResponse.fromJson(json.decode(response));
          print('brands length ${_promotionResponseModel.data!.length}');
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
    update(['brandPromo','PromotionScreen',true]);
  }
}