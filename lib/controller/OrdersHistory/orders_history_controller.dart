

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:saholatkar/Repositories/OrdersHistory/orders_history_repository.dart';
import 'package:saholatkar/model/OrdersHistory/orders_history_data_model.dart';

class OrdersHistoryController {
  final apiClient = OrdersHistoryRepository();

  Future<dynamic> getOrdersHistory() async {
    var response = await apiClient.getOrdersHistory();
    if (response != null) {
      var result = jsonDecode(response.body);
      OrdersHistoryDataModel data = OrdersHistoryDataModel.fromJson(result);
      return data.data as List<OrdersData>;
    }else {
      debugPrint('ERROR PARSING ORDERS');
    }
  }
}