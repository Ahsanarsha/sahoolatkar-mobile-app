import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../ProductDetails/product_details_screen.dart';

class QRScreenReader extends StatefulWidget {
  const QRScreenReader({Key? key}) : super(key: key);

  @override
  State<QRScreenReader> createState() => _QRScreenReaderState();
}

class _QRScreenReaderState extends State<QRScreenReader> {
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: MobileScanner(
              allowDuplicates: true,
              controller: cameraController,
              onDetect: (barcode, args) {
                if (barcode.rawValue == null) {
                  debugPrint('Failed to scan Barcode');
                } else {
                  final String code = barcode.rawValue!;
                  print(code);
                  Get.to(()=>ProductDetailsScreen(id: code));
                }
              }),
        ));
  }

}
