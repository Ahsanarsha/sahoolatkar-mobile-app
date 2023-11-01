// // import 'package:saholatkar/Repositories/UserProfile/user_profile_repo.dart';
// // import 'package:saholatkar/model/userProfile/user_profile.dart';

// // class UserProfileSingleton {
// //   final apiClient = UserProfileRepo();
// //   late ProfileData profileData;
// //   var _data;
// //   static final UserProfileSingleton _singleton =
// //       UserProfileSingleton._internal();

// //   factory UserProfileSingleton() {
// //     return _singleton;
// //   }

// //   void getProfile() async {
// //     dynamic userInfoModel = await apiClient.getProfile();
// //     _data = userProfileFromJson(userInfoModel);
// //     profileData = _data.data;
// //   }

// //   UserProfileSingleton._internal();
// // }

// import 'package:saholatkar/Repositories/UserProfile/user_profile_repo.dart';
// import 'package:saholatkar/model/userProfile/user_profile.dart';

// class UserProfileGlobal {
//   final apiClient = UserProfileRepo();
//   var _userInfo;
//   dynamic get userProfile => _userInfo;

//   getProfile(String api, String phone, String getOtp) async {
//     dynamic userInfoModel = await apiClient.getProfile();
//     if (userInfoModel != null) {
//       _userInfo = userProfileFromJson(userInfoModel);
//     }
//   }

//   dispose() {
//     _userInfo.close();
//   }
// }

// final userProfileGlobals = UserProfileGlobal();
