

import 'package:saholatkar/services/base_client.dart';

class OrdersHistoryRepository {

  final apiClient = BaseClient();


  Future<dynamic> getOrdersHistory() async {
    return await apiClient.getOrdersHistory();
  }
}