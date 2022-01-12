// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'dart:convert';
import 'package:ecommerceapiqa/models/banner_model.dart';
import 'package:ecommerceapiqa/models/product_model.dart';
import 'package:ecommerceapiqa/view/app/navigation_page.dart';
import 'package:ecommerceapiqa/view/auth/login_screen.dart';
import 'package:ecommerceapiqa/view/components/snackbar.dart';
import 'package:ecommerceapiqa/view/constants/url_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  var indicator = false;
  var isLoading = true;
  var isLoadings = true;
  final storage = FlutterSecureStorage();
  var bannerModel;
  var productModel;
  signIn(String username, String password, BuildContext context) async {
    
    Uri url = Uri.parse(baseUrl + 'User/Authenticate');
    var body = {
      "username": username,
      "password": password,
      "keepMeSignedIn": true,
      "otp": 123
    };
    var response = await http.post(url,
        body: json.encode(body),
        headers: {"Content-Type": "application/json"},
        encoding: Encoding.getByName("utf-8"));
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      indicator = true;

      if (data != null) {
        showSnackBar(message: 'Login Successful', context: context);
        await storage.write(key: 'token', value: data['token']);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationPage(),
            ),
            (_) => false);
      }
    } else if (response.statusCode == 401) {
      indicator = true;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['error'])));
    } else {
      indicator = true;

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Something went wrong')));
    }
    notifyListeners();
    return response;
  }

  Future<List<BannerModel>> getBannerData(context) async {
    var token = await storage.read(key: 'token');
    Uri url = Uri.parse(baseUrl + '/v1/OfferImageUpload/');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      bannerModel = bannerModelFromJson(response.body);

      isLoading = false;
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
    notifyListeners();

    return bannerModel;
  }

  Future<List<ProductModel>> getProductsData(context) async {
    var token = await storage.read(key: 'token');
    Uri url = Uri.parse(baseUrl + '/v1/Product?consumerId=3');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    // var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      productModel = productModelFromJson(response.body);

      isLoadings = false;
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
    notifyListeners();
    return productModel;
  }
}
