import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  String status = "";
  String message = "";

  Future signUp(
      // {
      // BuildContext? context,
      // String? phoneNumber,
      // String? username,
      // String? password,
      // String? confirmPassword,
      // String? email,
      // }
      ) async {
    String url = "https://pressendapp.onrender.com/api/v1/auth/sign-up-email";

    isLoading = true;
    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": "socialmediaward.official@gmail.com",
        "deviceModel": "Linux Mint 2",
        "currency": "NGN",
        "nationality": "Nigeria"
      },
    );
    print(response.body);
    var dataRes = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("Success");
      isLoading = false;
      notifyListeners();

    }
    else{
      print(dataRes["description"]);
      isLoading = false;
      notifyListeners();
    }
  }

  Future login(
      // {
      // BuildContext? context,
      // String? phoneNumber,
      // String? username,
      // String? password,
      // String? confirmPassword,
      // String? email,
      // }
      ) async {
    String url = "https://pressendapp.onrender.com/api/v1/auth/login";

    isLoading = true;
    var response = await http.post(
      Uri.parse(url),
      body: {
        "uId": "dapp.client@gmail.com",
        "password": "Abcd@1234!now",
        "deviceModel": "Linux Mint 2"
      },
    );
    print(response.body);
    var dataRes = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("Success");
      isLoading = false;
      notifyListeners();

    }
    else{
      print(dataRes["description"]);
      isLoading = false;
      notifyListeners();
    }
  }
}
