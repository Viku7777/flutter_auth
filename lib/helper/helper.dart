import 'package:shared_preferences/shared_preferences.dart';

class Helper {
//add Data
  addName(String name) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString("sfName", name);
  }

  addEMAIl(String email) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setString("sfEmail", email);
  }

  addStatus(bool status) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setBool("sfStatus", status);
  }

// Get Data
  Future<String?> getName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString("sfEmail");
  }

  Future<String?> getEmail() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString("sfName");
  }

  Future<bool?> getStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool("sfStatus");
  }
}
