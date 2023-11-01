import 'package:get/get.dart';
import 'package:saholatkar/controller/Trasnlation/translation_controller.dart';

import '../controller/ProfileMenu/AccountLevel/StoreLocator/store_locator_controller.dart';

class TranslationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TranslationController>(() => TranslationController());

    Get.lazyPut<StoreLocatorController>(() => StoreLocatorController());
  }
}
