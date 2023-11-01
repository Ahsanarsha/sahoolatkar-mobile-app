import 'package:saholatkar/model/PlaceOrderBody.dart';

import '../../model/merchant/BecomeMerchantBody.dart';
import '../../services/base_client.dart';

class PlaceOrderRepo{
  final apiClient = BaseClient();

  Future<dynamic> placeOrder(PlaceOrderBody body) async {
    return await apiClient.placeOrder(body);
  }
  Future<dynamic> getOrderDetails(String id) async {
    return await apiClient.getOrderDetails(id);
  }
  Future<dynamic> getInstallment(String id) async {
    return await apiClient.getInstallment(id);
  }
  Future<dynamic> setFav(int id) async {
    return await apiClient.addFavProduct(id);
  }Future<dynamic> removeFav(int id) async {
    return await apiClient.removeFavProduct(id);
  }
  Future<dynamic> requestForMerchant(BecomeMerchantBody body) async {
    return await apiClient.requestMerchant(body);
  }
  Future<dynamic> emptyCart() async {
    return await apiClient.emptyCart();
  }
}