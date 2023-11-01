import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:saholatkar/model/allData/BrandsModel.dart';
import 'package:saholatkar/model/allData/Categories.dart';
import 'package:saholatkar/model/allData/FeaturedProducts.dart';

import '../../Repositories/AllData/all_data_repo.dart';
import '../../model/HotCatData.dart';
import '../../model/HotCatData.dart' as hott;
import '../../model/product_model/BrandCatModel.dart';
import '../../model/product_model/BrandCatModel.dart' as brandData;
import '../../model/product_model/HotCategoryModel.dart';
import '../../model/product_model/BannerModel.dart';
import '../../model/product_model/GetCatResponse.dart';

class AllDataController extends GetxController{
  bool isLoading = false;
  bool isLoading2 = false;
  bool isLoading3 = false;
  final apiClient = AllDataRepo();
  BrandsModel _brand = BrandsModel();
  GetCatResponse _categories = GetCatResponse();
  FeaturedProducts _allFeaturedProducts = FeaturedProducts();
  BrandsModel get allBrands => _brand;
  FeaturedProducts get allFeaturedProducts => _allFeaturedProducts;
  GetCatResponse get allCategories => _categories;
  BrandCatModel searchModelResponse = BrandCatModel();
  List<brandData.Data>? responseList = [];
  List<hott.Data>? hotCatList = [];
  HotCategoryModel hotCategoryModel = HotCategoryModel();
  BannerModel bannerModel = BannerModel();
  List<int> qty = [];
  //pagination
  int pageNumber = 1;
  final bool isFirstLoadRunning = false;
  final ScrollController scrollController = ScrollController();
  final ScrollController scrollController2 = ScrollController();
  bool isLoadMoreRunning = false;
  bool hasNextPage = true;


  @override
  void onInit() {
    pageNumber = 1;
    // responseList = [];
    getBrandDetails();
    getBanner();
    getCategoriesDetails();
    getFeaturedProducts();
    getHotProducts();
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
    await apiClient.getBrands().then((response) async {
      isLoading = true;
      if (response != null) {
        debugPrint(response.toString());
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Successs") {
          _brand = BrandsModel.fromJson(json.decode(response));

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
  Future<dynamic> getCategoriesDetails() async {

    await apiClient.getCategories().then((response) async {
      print('get categories $response');
      isLoading2 = true;
      if (response != null) {
        debugPrint(response.toString());
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          _categories = GetCatResponse.fromJson(json.decode(response));
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
    isLoading2 = false;
    update();
  }
  Future<dynamic> getFeaturedProducts() async {
    debugPrint("fetching featured productsssss");
    await apiClient.getFeaturedProducts().then((response) async {
      isLoading3 = true;
      if (response != null) {
        debugPrint(response.toString());
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          _allFeaturedProducts = FeaturedProducts.fromJson(json.decode(response));
        } else {
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){
        debugPrint("Response for featured Products is null");
      }
      else{
        debugPrint("Response for featured Products don't know what happened");
      }
    });
    isLoading3 = false;
    update();
  }
  Future<dynamic> getHotProducts() async {
    debugPrint("fetching Hot products");
    await apiClient.getHotProducts().then((response) async {
      if (response != null) {
        debugPrint(response.toString());
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          hotCategoryModel = HotCategoryModel.fromJson(json.decode(response));
          debugPrint("fetching Hot products ${hotCategoryModel.data!.length}");
        } else {
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){
        debugPrint("Response for featured Products is null");
      }
      else{
        debugPrint("Response for featured Products don't know what happened");
      }
    });
    isLoading3 = false;
    update();
  }
  int page = 1;
  HotCatData catData = HotCatData();
  Future<dynamic> getHotProductsData(String cat) async {

    update();
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false) {

      await apiClient.getHotProductsData(page,cat).then((response) async {
        if (response != null) {
          var result = json.decode(response);
          var status = result["Status"];
          var message = result["message"];
          if (status == "Success") {
            hotCatList=[];
            print(result);
            var body = result['product']['data'] as List;
            if(body.isNotEmpty){
              catData = HotCatData.fromJson(json.decode(response));
              hotCatList?.addAll(catData.product!.data!);
              print('products length ${catData.product!.data!.length}');
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
    update();
  }
  Future<dynamic> getBanner() async {

    await apiClient.getBanners().then((response) async {
      if (response != null) {
        debugPrint(response.toString());
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          bannerModel = BannerModel.fromJson(json.decode(response));

        } else {
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){
        debugPrint("Response for featured Products is null");
      }
      else{
        debugPrint("Response for featured Products don't know what happened");
      }
    });
    isLoading3 = false;
    update();
  }



  Future<dynamic> getBrandProductsPaginated(String brand) async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false) {

      isLoadMoreRunning = true;
      await apiClient
          .getBrandsProduct(brand, pageNumber)
          .then((response) async {
       isLoadMoreRunning = true;
        if (response != null) {
          debugPrint(response.toString());
          var result = json.decode(response);
          var status = result["Status"];
          var message = result["message"];
          if (status == "Success") {
            var body = result['product']['data'] as List;
            if (body.isNotEmpty) {
             searchModelResponse =  BrandCatModel.fromJson(json.decode(response));
              responseList?.addAll(searchModelResponse.product!.data!);
              pageNumber++;
            } else {
              hasNextPage = false;
            }
          } else {
            Get.back();
            Get.snackbar("Message", message.toString());
          }
        } else if (response == null) {
          debugPrint("Response is null");
        } else {
          debugPrint("Don't know what happened");
        }
      });
      isLoadMoreRunning = false;
      update();
    }
  }
  Future<dynamic> getCatProductsPaginated(String cat) async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false) {

      isLoadMoreRunning = true;
      await apiClient
          .getCatProduct(cat, pageNumber)
          .then((response) async {
       isLoadMoreRunning = true;
        if (response != null) {
          debugPrint(response.toString());
          var result = json.decode(response);
          var status = result["Status"];
          var message = result["message"];
          if (status == "Success") {
            var body = result['product']['data'] as List;
            if (body.isNotEmpty) {
             searchModelResponse =  BrandCatModel.fromJson(json.decode(response));
              responseList?.addAll(searchModelResponse.product!.data!);
              pageNumber++;
            } else {
              hasNextPage = false;
            }
          } else {
            Get.back();
            Get.snackbar("Message", message.toString());
          }
        } else if (response == null) {
          debugPrint("Response is null");
        } else {
          debugPrint("Don't know what happened");
        }
      });
      isLoadMoreRunning = false;
      update();
    }
  }


  fetch(String lowerCase)async {
   await getBrandProductsPaginated(lowerCase);
  }fetchCat(String lowerCase)async {
   await getCatProductsPaginated(lowerCase);
  }
}