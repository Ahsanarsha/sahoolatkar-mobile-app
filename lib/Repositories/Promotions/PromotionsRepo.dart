import '../../services/base_client.dart';

class PromotionRepo {
  final apiClient = BaseClient();

  Future<dynamic> allProducts(int page) async {
    return await apiClient.getAllPromotions(page);
  }
  Future<dynamic> getPromotionByBrands(String brand) async {
    return await apiClient.getPromotionsByBrand(brand);
  }
  Future<dynamic> getGoals() async {
    return await apiClient.getGoals();
  }Future<dynamic> getPoints() async {
    return await apiClient.getPoints();
  }

  Future<dynamic> getPromotionByPrice(num min, num max) async {
    return await apiClient.getPromotionsByPrice(min,max);
  }
  Future<dynamic> getPromotionByPriceBrand(num min, num max,String brand) async {
    return await apiClient.getPromotionsByPriceBrand(min,max,brand);
  }


}