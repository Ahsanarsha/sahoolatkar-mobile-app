import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saholatkar/Repositories/Authentication/authentication_repo.dart';
import 'package:saholatkar/controller/UserProfile/user_profile.dart';
import 'package:saholatkar/helper/prefs.dart';
import 'package:saholatkar/model/authentication/register.dart';
import 'package:saholatkar/model/authentication/reset_password.dart';
import 'package:saholatkar/view/Authentication/forget_password.dart';
import 'package:saholatkar/view/Authentication/login_screen.dart';
import 'package:saholatkar/view/Authentication/reset_password.dart';
import 'package:saholatkar/view/BottemNavigationBar/bottem_navigation_bar.dart';

import '../../view/Authentication/verify_auth_screen.dart';
import '../../view/profile/components/TwoFactorAuthentication/auth_success_screen.dart';

class AuthenticationController extends GetxController {
  bool isLoading = false;
  bool isSending = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgetEmailController = TextEditingController();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();

  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  var email = "";
  var password = "";
  final apiClient = AuthenticationRepo();

  @override
  void onInit() {
    super.onInit();
  }

  Future<dynamic> login(String email, String password) async {
    debugPrint("Going to login");
    isLoading = true;
    await apiClient.login(email, password).then((response) async {
      // EasyLoading.dismiss());
      debugPrint("After login the response received is: ${response.toString()}");

      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status.contains('Success')) {
          var token = result['data']['token'];
          var id = result['data']['id'];
          await Prefs.setString("userToken", token);
          await Prefs.setString("userId", id.toString());
          UserProfileController().getUserProfile();
          Get.snackbar("Message", message.toString());
          showNext();
        } else {
          // DialogHelper.showToast(message);
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){
        debugPrint("Response is null");
      }
      else{
        debugPrint("Don't know what happened");
      }
    });

    isLoading = false;
    update();
  }

  Future<dynamic> sendOtp(String email) async {
    isSending = true;
    update();
    await apiClient.sendEmailCode(email).then((response) async {
      if (response != null) {

        var result = json.decode(response);

        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          Get.snackbar("Message", message.toString());
          //showNext();
          return true;
        } else {
          // DialogHelper.showToast(message);
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){
        debugPrint("Response is null");
      }
      else{
        debugPrint("Don't know what happened");
      }
    });

    isSending = false;
    update();
  }
  Future<dynamic> sendNoOtp(int email) async {
    isSending = true;
    update();
    await apiClient.sendNoCode(email).then((response) async {
      if (response != null) {

        var result = json.decode(response);

        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          Get.snackbar("Message", message.toString());
          //showNext();
          return true;
        } else {
          // DialogHelper.showToast(message);
          Get.back();
          Get.snackbar("Message", message.toString());
        }
      }
      else if(response == null){
        debugPrint("Response is null");
      }
      else{
        debugPrint("Don't know what happened");
      }
    });

    isSending = false;
    update();
  }

 verifyCode(int code,BuildContext ctx) async {
    isLoading = true;
    await apiClient.verifyCode(code).then((response) async {
      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        print(result);
        if (status == "Faild") {
          Navigator.pop(ctx);
            Get.snackbar("Message", message);

        } else if (status == "Success") {
            Get.snackbar("Message", message);
            Get.off(() =>
             AuthSuccessScreen(
                successMessage:
                "Your Email is verified."));

        }
      }
    });

    isLoading = false;
    update();
  }
  Future<dynamic> verifyOtp(int code,int id) async {
    isLoading = true;
    await apiClient.verifyOtp(code,id).then((response) async {
      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          //Get.back();
          Get.snackbar("Message", message);
        } else {
          //Get.to(() => const ForgetPasswordScreen());
          Get.snackbar("Message", message);
        }
      }
    });
    isLoading = false;
    update();
  }
  Future<dynamic> resetCode(String email,int code) async {
    isLoading = true;
    await apiClient.resetCode(email,code).then((response) async {
      if (response != null) {
        var result = json.decode(response);
        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          Get.back();
          Get.snackbar("Message", message);
        } else {
          //Get.to(() => const ForgetPasswordScreen());
          Get.snackbar("Message", message);
        }
      }
    });
    isLoading = false;
    update();
  }

  Future<dynamic> resetPassword(
      String? email, String password, String confirmPassword) async {
    debugPrint("Gonna reset password");
    isLoading = true;

    var resetDataModel = ResetPassword(
        email: email,
        password: password,
        passwordconfirmation: confirmPassword);

    debugPrint(resetDataModel.toString());
    await apiClient.resetPassword(resetDataModel).then((response) async {
      debugPrint("Response when resetting password is: ${response.toString()}");
      if (response != null) {
        var result = json.decode(response);

        var status = result["Status"];
        var message = result["message"];
        if (status == "Success") {
          Get.snackbar("Message", message);
        } else {
          Get.snackbar("Message", message);
        }
      }
    });
    isLoading = false;
    update();
  }

  Future<dynamic> forgetpassword(String email) async {
    await apiClient.forgetpassword(email).then(
      (response) {
        debugPrint("SOme response is received");
        if (response != null) {
          debugPrint("SOme response is received2");
          var result = json.decode(response);
          debugPrint("Returned response is Result: ${result.toString()}");
          var status = result["Status"];
          var message = result["message"];
          if (status == "Success") {
            Get.off(() =>  ResetPasswordScreen(email: email));
            //  Get.back();
            Get.snackbar("Message", message.toString());
          } else {
            Get.back();
            Get.snackbar("Message", message.toString());
          }
        } else if (response == null) {
          debugPrint("Response is null");
        } else {
          debugPrint("SOme response is received3");
        }
      },
    );
  }

  Future<void> showNext() async {
    await Future.delayed(const Duration(seconds: 1), () {
      Get.offAll(() => const BottemNavigationScreen());
    });
  }

  Future<void> register() async {
    debugPrint(
        "The data going to save is \nEmail: ${emailController.text}, Name:${fullNameController.text}, Mobile: ${phoneController.text}, password: ${passwordController.text},");
    final user = Register(
        email: emailController.text,
        name: fullNameController.text,
        mobile: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmedPasswordController.text,);

    await apiClient.register(user).then((response) {
      debugPrint("The response on signup is : ${response.toString()}");

      var result = json.decode(response);
      var status = result["Status"];
      var message = result["message"];
      if (status == 'Success') {

        // DialogHelper.showToast(message);
        // Get.snackbar("Message", message.toString());
        onEmpty();
        Get.offAll(() =>
        const LoginScreen());
        // Get.offAll(() =>  VerifyAuthScreen(id: result["id"],mail: user.email.toString(),));
      } else {
        Get.back();
        // DialogHelper.showToast(message);
        if(message['mobile']!=null){
          Get.snackbar("Message", message['mobile'].toString().replaceAll(']', '').replaceAll('[', '').toString());
        }else if(message['email']!=null){
          Get.snackbar("Message", message['email'].toString().replaceAll(']', '').replaceAll('[', '').toString());
        }else if(message['password']!=null){
          Get.snackbar("Message", message['password'].toString().replaceAll(']', '').replaceAll('[', '').toString());
        }

      }
    });
  }

  onEmpty() {
    fullNameController.clear();
    phoneController.clear();
    passwordController.clear();
    confirmedPasswordController.clear();
    emailController.clear();
    forgetEmailController.clear();
    loginPasswordController.clear();
    loginEmailController.clear();
  }
 //Bilal
  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();
    forgetEmailController.dispose();

    super.dispose();
  }
}

//I added a comment in the code
