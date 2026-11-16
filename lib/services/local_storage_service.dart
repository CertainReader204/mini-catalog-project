import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

// Bu servis kullanıcı adını cihazın yerel hafızasında saklar.
class LocalStorageService {
  Future<void> saveData (String username) async {
    final prefs = await SharedPreferences.getInstance();

    log("Kaydedilen isim: $username");

    await prefs.setString("ls_name", username);
  }
  

  Future<String> getData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("ls_name") ?? "";
  }

  Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("ls_name");
  }
}