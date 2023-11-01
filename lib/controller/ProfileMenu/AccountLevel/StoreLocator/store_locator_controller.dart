import 'package:get/get.dart';
import 'package:saholatkar/Repositories/profileMenu/profile_menu_repo.dart';
import 'package:saholatkar/model/profileMenu/store_locator.dart';

class StoreLocatorController extends GetxController {
  bool isLoading = false;

  final apiClient = ProfileMenuRepo();
  List<StoreLocatorData> storeLocations = [];
  @override
  void onInit() {
    // getStoreLocations();
    super.onInit();
  }

  Future<dynamic> getStoreLocations() async {
    isLoading = true;

    await apiClient.getStoreLocations().then((response) async {
      if (response != null) {
        var data = stroreLocatorFromJson(response);
        storeLocations = data.data ?? [];
        isLoading = false;
      }
    });
  }
}
