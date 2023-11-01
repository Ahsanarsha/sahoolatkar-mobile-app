
import 'package:saholatkar/model/product_model/Product_Model.dart';
import 'package:saholatkar/services/base_client.dart';

class AddToCartRepository {
  final apiClient = BaseClient();

  Future<dynamic> addToCart({required ShopItemModel model}) async {
    return await apiClient.addProductToCart(model);
  }

  Future<dynamic> removeFromCart({required int id}) async {
    return await apiClient.removeProductFromCart(id);
  }
Future<dynamic> getFromCart() async {
    return await apiClient.getCartProducts();
  }

   Future<dynamic> getOrderDetails(String id) async {
    return await apiClient.getOrderDetails(id);
  }



}