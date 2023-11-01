import 'dart:async';

import 'package:saholatkar/services/base_client.dart';

class AllDataRepo {
  final apiClient = BaseClient();

  Future<dynamic> getBrands() async {
    return await apiClient.getBrands();
  }

  Future<dynamic> getCategories() async {
    return await apiClient.getCategories();
  }

  Future<dynamic> getFeaturedProducts() async {
    return await apiClient.getFeaturedProducts();
  }

  Future<dynamic> getHotProducts() async {
    return await apiClient.getHotProducts();
  }
  Future<dynamic> getHotProductsData(int p,String cat) async {
    return await apiClient.getHotProductsData(p,cat);
  }

  Future<dynamic> getSearchProducts(String product) async {
    return await apiClient.getSearchedProducts(product);
  }
  Future<dynamic> getFavPro() async {
    return await apiClient.getFavProducts();
  }

  Future<dynamic> getBrandsProduct(String brand, int pageNumber) async {
    return await apiClient.getBrandsProduct(brand, pageNumber);
  }

  Future<dynamic> getCatProduct(String cat, int pageNumber) async {
    return await apiClient.getCatProduct(cat, pageNumber);
  }
  Future<dynamic> getBanners() async {
    return await apiClient.getBanner();
  }
}
