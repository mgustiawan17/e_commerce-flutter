import 'package:shared_preferences/shared_preferences.dart';

class LoginPref {
  //save the preference/session
  //user for login
  static saveToSharedPref(String idUser, String username) async {
    //membaca disk dalam perangkat/ membuka sharedpref dulu
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //simpan data dengan tipe data string ke sharepref

    prefs.setString("id_user", idUser);
    prefs.setString("username", username);
  }

  //check the existence of preference/session
  static Future<bool> checkPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //cek apakah didalam sharepref terdapat data yang mengandung key"ID user"
    //jika betul ada makan akan mengembalikan nilai true , sebaliknya kembalikan nilai false
    bool checkValue = prefs.containsKey('id_user');

    return checkValue;
  }

  //logout
  static Future<bool> removePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    return true;
  }

//mengambil id_user dan username preference
  static Future<Map<String, String>> getValuePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return {
      "id_user": preferences.getString("id_user")!,
      "username": preferences.getString("username")!,
    };
  }
}
