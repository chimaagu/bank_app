import 'package:shared_preferences/shared_preferences.dart';

class DbProvider {
  saveFirstTransfer(bool firstTransfer) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.setBool("firstTransfer", firstTransfer);
    print(firstTransfer);
  }

  getFirstTransfer() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    var value = sf.getBool("firstTransfer");
    print("gotten $value");
  }
}
