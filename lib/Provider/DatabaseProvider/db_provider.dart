import 'package:shared_preferences/shared_preferences.dart';

class DbProvider {
  //TODO: saving user preferences
  saveFirstTransfer(bool firstTransfer) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setBool("firstTransfer", firstTransfer);
    // print(firstTransfer);
  }

  saveTransferPin(String transferPin) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString("transferPin", transferPin);
    // print(transferPin);
  }

  //TODO: getting user preferences
  getFirstTransfer() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    var value = sf.getBool("firstTransfer");
    // print("gotten $value");
  }

  getTransferPin() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    var value = sf.getString("transferPin");
    // print("gotten $value");
  }

  saveUserData(
      {String? email,
      phone,
      name,
      dob,
      country,
      occupation,
      accountType,
      password,
      currency,
      confirmPassword}) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setString("email", email!);
    sf.setString("phone", phone);
    sf.setString("name", name);
    sf.setString("dob", dob);
    sf.setString("country", country);
    sf.setString("occupation", occupation);
    sf.setString("accountType", accountType);
    sf.setString("password", password);
    sf.setString("currency", currency);
    sf.setString("confirmPassword", confirmPassword);

    print(email);
    print(phone);
  }
}
