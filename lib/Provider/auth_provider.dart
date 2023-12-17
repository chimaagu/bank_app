import 'dart:convert';

import 'package:bank_app/Provider/DatabaseProvider/db_provider.dart';
import 'package:bank_app/Utils/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool isLoading = false;
  String status = "";
  String message = "";

  Future signUp({
    BuildContext? context,
    String? nationality,
    String? name,
    String? currency,
    String? email,
    String? phone,
    String? dob,
    String? occupation,
    String? accountType,
    String? password,
    String? comnfirmPassword,
  }) async {
    String url = "https://pressendapp.onrender.com/api/v1/auth/sign-up-email";

    isLoading = true;
    notifyListeners();
    var response = await http.post(
      Uri.parse(url),
      body: {
        "email": email,
        "deviceModel": "Linux Mint 2",
        "currency": currency,
        "nationality": nationality,
      },
    );
    print(response.body);
    var dataRes = jsonDecode(response.body);
    if (response.statusCode == 200) {
      showSnackBar("Logged in Successfully", context!);
      DbProvider().saveUserData(
        accountType: accountType,
        confirmPassword: comnfirmPassword,
        country: nationality,
        currency: currency,
        dob: dob,
        email: email,
        name: name,
        occupation: occupation,
        password: password,
        phone: phone,
      );
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
      print(dataRes["description"]);
      showSnackBar(dataRes["description"], context!);
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
    } else {
      print(dataRes["description"]);
      isLoading = false;
      notifyListeners();
    }
  }
}
