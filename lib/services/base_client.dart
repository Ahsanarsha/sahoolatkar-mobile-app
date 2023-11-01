import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:saholatkar/helper/BlocUserProfile.dart';
import 'package:saholatkar/helper/prefs.dart';
import 'package:saholatkar/model/accountLevel/appointment.dart';
import 'package:saholatkar/model/accountLevel/bank.dart';
import 'package:saholatkar/model/accountLevel/education.dart';
import 'package:saholatkar/model/authentication/register.dart';
import 'package:saholatkar/model/authentication/reset_password.dart';
import 'package:saholatkar/model/product_model/Product_Model.dart';
import 'package:saholatkar/services/app_exceptions.dart';

import '../model/InstallmentRequestBody.dart';
import '../model/PlaceOrderBody.dart';
import '../model/merchant/BecomeMerchantBody.dart';

class BaseClient {
  static const int TIME_OUT_DURATION = 20;
  // static const String baseUrl = "http://192.168.5.5:9000";
  static const String baseUrl = "https://staging.sahoolatkar.com";
  var token = Prefs.getString("userToken");
  var userId = Prefs.getString("userId");

  //POST
  Future<dynamic> login(String email, String password) async {
    var uri = Uri.parse("$baseUrl/api/login");
    var token = Prefs.getString("userToken");
    var userId = Prefs.getString("userId");
    debugPrint("User Token is : $token");
    debugPrint("User Id is : $userId");

    var payload1 = jsonEncode({'email': email, 'password': password});
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> resetPassword(ResetPassword resetDataModel) async {
    var uri = Uri.parse("$baseUrl/api/reset-password");

    var payload1 = resetPasswordToJson(resetDataModel);
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> sendEmailCode(String email) async {
    var uri = Uri.parse("$baseUrl/api/otp");
    var payload1 = jsonEncode({'email': email});
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> sendNoCode(int email) async {
    var uri = Uri.parse("$baseUrl/api/otp");
    var payload1 = jsonEncode({'phone': email});
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> placeOrder(PlaceOrderBody placeOrderBody) async {
    var uri = Uri.parse("$baseUrl/api/checkout");
    var payload1 = jsonEncode(placeOrderBody);
    try {
      var response = await http
          .post(uri,
              headers: {
                'Accept': 'application/json',
                "Content-Type": "application/json",
                'Authorization': "Bearer $token",
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getOrderDetails(String id) async {
    var uri = Uri.parse("$baseUrl/api/product-detail");
    var payload1 = {
      'product_id' : id
    };
    try {
      var response = await http
          .post(uri,
              headers: {
                'Accept': 'application/json',
                'Authorization': "Bearer $token",
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getInstallment(String id) async {
    var uri = Uri.parse("$baseUrl/api/installment-detail");
    var payload1 = {
      'product_id' : id
    };
    try {
      var response = await http
          .post(uri,
              headers: {
                'Accept': 'application/json',
                'Authorization': "Bearer $token",
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> requestMerchant(BecomeMerchantBody body) async {
    var uri = Uri.parse("$baseUrl/api/merchant-request");
    var payload1 = jsonEncode(body);
    try {
      var response = await http
          .post(uri,
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json',
                'Authorization': "Bearer $token",
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> verifyCode(int code) async {
    var uri = Uri.parse("$baseUrl/api/verifyOtp");

    var payload1 = jsonEncode({'email_otp': code, 'user_id': userId});
    
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token",
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> verifyOtp(int code,int uId) async {
    var uri = Uri.parse("$baseUrl/api/register-otp");

    var payload1 = jsonEncode({'email_otp': code, 'user_id': uId});
    
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token",
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> resetCode(String email ,int code) async {
    var uri = Uri.parse("$baseUrl/api/check-code");

    var payload1 = jsonEncode({'email': email, 'code': code});
    
    try {
      var response = await http
          .post(uri,
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': "Bearer $token",
          },
          body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> register(Register register) async {
    var bodyObj = registerToJson(register);
    try {
      var response = await http
          .post(Uri.parse("$baseUrl/api/register"),
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
              },
              body: bodyObj)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time');
    }
  }

  Future<dynamic> getTransactions(String id) async {
    var bodyObj = {'user_id': id};
    try {
      var response = await http
          .post(Uri.parse("$baseUrl/api/transactions"),
              headers: {
                'Accept': 'application/json',
                'Authorization': "Bearer $token",
              },
              body: bodyObj)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw ApiNotRespondingException('API not responded in time');
    }
  }

  Future<dynamic> forgetPassword(String email) async {
    var uri = Uri.parse("$baseUrl/api/forgot-password");
    // var token = Prefs.getString("userToken");
    // var userId = Prefs.getString("userId");

    var payload1 = jsonEncode({
      'email': email,
    });
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  // POST
  Future<dynamic> removeProductFromCart(int productId) async {
    var uri = Uri.parse("$baseUrl/api/remove-from-cart");

    var payload1 = jsonEncode(
        {'product_id': productId, 'user_id': blocUserProfile.viewModelUser.data![0].id});
    try {
      var response = await http
          .post(uri,
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': "Bearer $token",
          },
          body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> addFavProduct(int productId) async {
    var uri = Uri.parse("$baseUrl/api/add-favourite");

    var payload1 = jsonEncode(
        {'product_id': productId, 'user_id': blocUserProfile.viewModelUser.data![0].id});
    try {
      var response = await http
          .post(uri,
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': "Bearer $token",
          },
          body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> removeFavProduct(int productId) async {
    var uri = Uri.parse("$baseUrl/api/wishlist-remove");

    var payload1 = jsonEncode(
        {'product_id': productId});
    try {
      var response = await http
          .post(uri,
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': "Bearer $token",
          },
          body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  //POST
  Future<dynamic> addProductToCart(ShopItemModel model) async {
    var uri = Uri.parse("$baseUrl/api/add-to-cart");
 
    var payload1 = jsonEncode(
        {'product_id': model.id, 'user_id': userId, 'quantity': model.qta});
    
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token",
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getCartProducts() async {
    var uri = Uri.parse("$baseUrl/api/cart");

    var payload1 = jsonEncode(
        {'user_id': blocUserProfile.viewModelUser.data![0].id.toString()});
    
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token",
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //GET
  Future<dynamic> getFaqs() async {
    var uri = Uri.parse("$baseUrl/api/faqs");
    try {
      var response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getLocation() async {
   
    var uri = Uri.parse("$baseUrl/api/store-locator");
    try {
      var response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //GET
  Future<dynamic> getAllPromotions(int pageNumber) async {
    
    var uri = Uri.parse("$baseUrl/api/allproducts?page=$pageNumber");
    try {
      var response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getGoals() async {

    var uri = Uri.parse("$baseUrl/api/get-goals");
    try {
      var response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> getPromotionsByBrand(String brand) async {
    var uri = Uri.parse("$baseUrl/api/barnd_product");
    try {
      var response = await http.post(uri, headers: {
        'Authorization': "Bearer $token"
      }, body: {
        'brand': brand
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getPoints() async {
    var uri = Uri.parse("$baseUrl/api/get-points");
    try {
      var response = await http.post(uri, headers: {
        'Authorization': "Bearer $token"
      }, body: {
        'user_id': blocUserProfile.viewModelUser.data![0].id.toString()
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> getOrdersHistory() async {
    var uri = Uri.parse("$baseUrl/api/orders");
    try {
      var response = await http.post(uri, headers: {
        'Authorization': "Bearer $token"
      }, body: {
        'user_id': blocUserProfile.viewModelUser.data![0].id.toString()
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> getPromotionsByPrice(num min, num max) async {
    var uri = Uri.parse("$baseUrl/api/pricefilter_product");

    try {
      var response = await http.post(uri, headers: {
        // "Content-Type": "application/json",
        'Authorization': "Bearer $token"
      }, body: {
        'min': min.toString().contains('.')?min.toString().substring(0,min.toString().indexOf('.')):min.toString(),
        'max': max.toString().contains('.')?max.toString().substring(0,max.toString().indexOf('.')):max.toString()
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> getPromotionsByPriceBrand(
      num min, num max, String brand) async {
    var uri = Uri.parse("$baseUrl/api/pricefilter_brand");
    try {
      var response = await http.post(uri, headers: {
        // "Content-Type": "application/json",
        'Authorization': "Bearer $token"
      }, body: {
        'min': min.toString().contains('.')?min.toString().substring(0,min.toString().indexOf('.')):min.toString(),
        'max': max.toString().contains('.')?max.toString().substring(0,max.toString().indexOf('.')):max.toString(),
        'brand': brand
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST
  Future<dynamic> getUserProfile(String id) async {
    
    var uri = Uri.parse("$baseUrl/api/profile");

    try {
      var response = await http.post(uri, headers: {
        'Authorization': "Bearer $token"
      }, body: {
        'user_id': id
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> emptyCart() async {

    var uri = Uri.parse("$baseUrl/api/delete-cart");

    try {
      var response = await http.post(uri, headers: {
        'Authorization': "Bearer $token"
      }, body: {
        'user_id': blocUserProfile.viewModelUser.data![0].id.toString()
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //GET
  // Future<dynamic> getProfile() async {
  //   
  //   var uri = Uri.parse("$baseUrl/api/get-profile");
  //
  //   try {
  //     var response = await http.get(
  //       uri,
  //       headers: {
  //         "Content-Type": "application/json",
  //         // 'Accept': 'application/json',
  //         'Authorization': "Bearer $token"
  //       },
  //     ).timeout(const Duration(seconds: TIME_OUT_DURATION));
  //    
  //     return _processResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection', uri.toString());
  //   } on TimeoutException {
  //     throw ApiNotRespondingException(
  //         'API not responded in time', uri.toString());
  //   }
  // }

  Future<dynamic> getBrands() async {
    
    var uri = Uri.parse("$baseUrl/api/brands");

    try {
      var response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          // 'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getBanner() async {
    var uri = Uri.parse("$baseUrl/api/baners");

    try {
      var response = await http.get(
        uri,
        headers: {
          // "Content-Type": "application/json",
          // 'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getBrandsProduct(String brand,int pageNumber) async {

    var uri = Uri.parse("$baseUrl/api/brand-product?page=$pageNumber");

    try {
      var response = await http.post(
        uri,
        headers: {

          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },body: {
          'brand': brand
      }
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getCatProduct(String cat,int pageNumber) async {

    var uri = Uri.parse("$baseUrl/api/category-product?page=$pageNumber");

    try {
      var response = await http.post(
        uri,
        headers: {

          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },body: {
          'category': cat
      }
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> getCategories() async {
    
    var uri = Uri.parse("$baseUrl/api/get-categories");

    try {
      var response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          // 'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> getFeaturedProducts() async {
    
    var uri = Uri.parse("$baseUrl/api/featured_product");

    try {
      var response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          // 'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getHotProducts() async {
    
    var uri = Uri.parse("$baseUrl/api/hot-category");
    try {
      var response = await http.get(
        uri,
        headers: {
          // "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getHotProductsData(int pageNumber,String cat) async {
    
    var uri = Uri.parse("$baseUrl/api/hotcat-product?page=$pageNumber");
    try {
      var response = await http.post(
        uri,
        body: {'category':cat},
        headers: {
          // "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getSearchedProducts(String product) async {

    var uri = Uri.parse("$baseUrl/api/search-product");

    try {
      var response = await http.post(
        uri,
        headers: {
          // "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },body: {
          'product':product
      }
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
     
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //GET
  Future<dynamic> getStoreLocations() async {
    var uri = Uri.parse("$baseUrl/api/store-locator");

    try {
      var response = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          // 'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> getFavProducts() async {
    var uri = Uri.parse("$baseUrl/api/get-favourite");

    try {
      var response = await http.post(
        uri,
        headers: {
          // "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },body: {'user_id':blocUserProfile.viewModelUser.data![0].id.toString()}
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> updateProfile(dynamic profileModel) async {
    var uri = Uri.parse("$baseUrl/api/profile-update");

    var payload1 = jsonEncode(profileModel);
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> suggestNewProduct(dynamic suggestProductModel) async {
    var uri = Uri.parse("$baseUrl/api/suggest-product");


    try {
      var response = await http
          .post(uri,
              headers: {
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: suggestProductModel)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> changePassword(dynamic changePasswordModel) async {
    var uri = Uri.parse("$baseUrl/api/change-password");

    var payload1 = jsonEncode(changePasswordModel);
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //GET
  Future<dynamic> getAccountLevelData() async {
    var uri = Uri.parse("$baseUrl/api/check-account");
    try {
      var response = await http.post(uri, headers: {
        //"Content-Type": "application/json",
        // 'Accept': 'application/json',
        'Authorization': "Bearer $token"
      }, body: {
        "user_id": blocUserProfile.viewModelUser.data![0].id.toString()
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return jsonDecode(response.body);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> addAppointment(dynamic appointmentModel) async {
    var uri = Uri.parse("$baseUrl/api/appointment");

    var payload1 = appointmentToJson(appointmentModel);
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> updateAppointment(dynamic appointmentModel, String id) async {

    var uri = Uri.parse("$baseUrl/api/appointment-update/$id");

    var payload1 = appointmentToJson(appointmentModel);
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> addPersonal(dynamic personalModel) async {

    var uri = Uri.parse("$baseUrl/api/personal");

    var payload1 = appointmentToJson(personalModel);
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> updatePersonal(dynamic personalModel) async {
    var uri = Uri.parse("$baseUrl/api/add-account-detail");

    var payload1 = personalModel;
    try {
      var response = await http
          .post(uri,
              headers: {
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> addEducation(dynamic educationModel) async {
    var uri = Uri.parse("$baseUrl/api/add-account-detail");

    var payload1 = educationModel;
    try {
      var response = await http
          .post(uri,
              headers: {
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> updateEducation(dynamic educationModel, String id) async {
    var uri = Uri.parse("$baseUrl/api/education-update/$id");

    var payload1 = educationToJson(educationModel);
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> addBankDetail(dynamic bankModel) async {
    var uri = Uri.parse("$baseUrl/api/add-account-detail");


    try {
      var response = await http
          .post(uri,
              headers: {
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: bankModel)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> updateBankDetail(dynamic bankModel, String id) async {
    var uri = Uri.parse("$baseUrl/api/bank-update/$id");

    var payload1 = bankToJson(bankModel);
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }
  Future<dynamic> makeInstallmentRequest(InstallmentRequestBody body) async {
    var uri = Uri.parse("$baseUrl/api/installment-request");

    var payload1 = jsonEncode(body);
    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                // 'Accept': 'application/json',
                'Authorization': "Bearer $token"
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //POST

  Future<dynamic> uploadUtilityBill(String id,{required String imageData}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/add-account-detail'),
    );
    request.fields.addAll({
      'user_id' : id
    });

    var token = Prefs.getString("userToken");

    try {
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      request.files.add(await http.MultipartFile.fromPath('utilitybill', imageData));

      var streamResponse = await request.send();

      var response = await http.Response.fromStream(streamResponse);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', request.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', request.toString());
    }
  }



  //POST

  Future<dynamic> uploadDrivingLicense({required String imageData}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/add-account-detail'),
    );
    request.fields.addAll({
      'user_id' : blocUserProfile.viewModelUser.data![0].id.toString()
    });
    var token = Prefs.getString("userToken");

    try {
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      request.files
          .add(await http.MultipartFile.fromPath('driving_license', imageData));

      var streamResponse = await request.send();

      var response = await http.Response.fromStream(streamResponse);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', request.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', request.toString());
    }
  }

  Future<dynamic> updateDrivingLicense(
      {required String imageData, required String id}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/driving-license-update/$id'),
    );

    var token = Prefs.getString("userToken");

    try {
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      request.files
          .add(await http.MultipartFile.fromPath('license', imageData));

      var streamResponse = await request.send();

      var response = await http.Response.fromStream(streamResponse);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', request.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', request.toString());
    }
  }

  //POST

  Future<dynamic> uploadLivePhoto({required String imageData}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/add-account-detail'),
    );
    request.fields.addAll({
      'user_id' : blocUserProfile.viewModelUser.data![0].id.toString()
    });
    var token = Prefs.getString("userToken");

    try {
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      request.files.add(await http.MultipartFile.fromPath('live_photo', imageData));

      var streamResponse = await request.send();

      var response = await http.Response.fromStream(streamResponse);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', request.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', request.toString());
    }
  }

  Future<dynamic> updateLivePhoto(
      {required String imageData, required String id}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/api/live-photo-update/$id'),
    );

    var token = Prefs.getString("userToken");

    try {
      request.headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      request.files.add(await http.MultipartFile.fromPath('photo', imageData));

      var streamResponse = await request.send();

      var response = await http.Response.fromStream(streamResponse);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', request.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', request.toString());
    }
  }

  //POST
  Future<dynamic> getDashboard(String baseUrll, String api) async {
    var uri = Uri.parse(baseUrll + api);
    var token = Prefs.getString("userToken");
    var userId = Prefs.getString("userId");
    var payload1 = jsonEncode({
      'staff_id': userId,
    });

    

    try {
      var response = await http
          .post(uri,
              headers: {
                "Content-Type": "application/json",
                'Accept': 'application/json',
                'Authorization': token
              },
              body: payload1)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;

      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        print(response.statusCode.toString());
      throw FetchDataException(
          'Error occurred with code : ${response.statusCode}',
          response.request!.url.toString());
    }
  }
}
