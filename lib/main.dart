import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Binding/translation_binding.dart';
import 'package:saholatkar/config/traslation.dart';
import 'package:saholatkar/helper/prefs.dart';
import 'package:saholatkar/view/Splash/SplashScreen.dart';

import 'helper/BlocUserProfile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  await blocUserProfile.initProfile();
  runApp(const MyApp());

  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      initialBinding: TranslationBinding(),
      title: 'SahoolatKar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomeScreen(),
      home: const SplashScreen(),
    );
  }
}



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
