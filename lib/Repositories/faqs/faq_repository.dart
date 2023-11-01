

import 'package:saholatkar/services/base_client.dart';

class FaqRepository {
  final apiClient = BaseClient();

  Future<dynamic> getFaqs() async {
    return await apiClient.getFaqs();
  }
}