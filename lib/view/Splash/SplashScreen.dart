
import 'package:flutter/material.dart';
import 'package:saholatkar/view/BottemNavigationBar/bottem_navigation_bar.dart';

import '../../helper/prefs.dart';
import '../Authentication/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      Future.delayed(const Duration(seconds: 2 )).then((value) =>    checkInitialScreen());

    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset('assets/images/SK-logo.png')),
    );
  }

  void checkInitialScreen() async{
    bool tokenExist = false;
    var token = Prefs.getString("userToken");
    debugPrint("Token: $token");
    if(token.isNotEmpty){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const BottemNavigationScreen()),
      );
    }else{
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginScreen()),
      );
    }
  }
}
