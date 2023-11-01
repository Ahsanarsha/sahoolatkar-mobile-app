import 'dart:async';
import 'dart:convert';
import 'package:saholatkar/helper/prefs.dart';
import 'package:saholatkar/model/userProfile/GetUserModel.dart';

class BlocUserProfile {
  bool isUserLoggedIn = false;
  GetUserModel viewModelUser = GetUserModel();

// STREAM
  final streamController = StreamController<GetUserModel>.broadcast();

  StreamSink<GetUserModel> get userProfileSink => streamController.sink;

  Stream<GetUserModel> get userProfileStream => streamController.stream;

  BlocUserProfile();

  initProfile() async {
    String? profile = await Prefs.get('userData');
    if (profile == null) {
      isUserLoggedIn = false;
    } else {
      isUserLoggedIn = true;
      Map<String, dynamic> user = jsonDecode(profile);
      viewModelUser = GetUserModel.fromJson(user);
    }
  }
}

BlocUserProfile blocUserProfile = BlocUserProfile();
