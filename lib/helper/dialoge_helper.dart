import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show error dialog
  static void showCustomeErroDialog(
      {String? title = 'Message',
      String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title!,
                style: Get.textTheme.headline5,
              ),
              const SizedBox(height: 5),
              Text(
                description!,
                style: const TextStyle(fontSize: 14),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.grey),
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showErroDialog(
      {String? title = 'Message',
      String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title!,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                description!,
                style: const TextStyle(fontSize: 14),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        webShowClose: true,
        backgroundColor: Colors.grey,
        textColor: Colors.black);
  }

  // static void showToast(String msg) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 2,
  //       webShowClose: true,
  //       backgroundColor: AppColors.TOAST_COLOR,
  //       textColor: Colors.black);
  // }

  // static void showProductAddToast(String msg) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 3,
  //       webShowClose: true,
  //       backgroundColor: Colors.black,
  //       textColor: Colors.white);
  // }

  // static void showProductListToast(String msg) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 2,
  //       webShowClose: true,
  //       backgroundColor: Colors.black,
  //       textColor: Colors.white);
  // }

}
