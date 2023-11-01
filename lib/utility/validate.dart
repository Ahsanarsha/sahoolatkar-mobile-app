import 'package:get/get.dart';
import 'package:saholatkar/controller/Trasnlation/translation_controller.dart';

final TranslationController _translationController =
    Get.find<TranslationController>();

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}

validateField({required String value, required String fieldName}) {
  if (value == null || value.isEmpty) {
    return '$fieldName field required';
  }
  return null;
}

validateRequestFormField({required String value, required String fieldName}) {
  if (value == null || value.isEmpty) {
    if (_translationController.selectedLanguage.value == "ur") {
      return '$fieldName لکھیں';
    } else {
      return '$fieldName  required';
    }
  }
  return null;
}
