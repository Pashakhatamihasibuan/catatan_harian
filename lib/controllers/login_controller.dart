import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoggedIn = false.obs;

  // Method untuk login
  Future<void> login(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (email == savedEmail && password == savedPassword) {
      isLoggedIn.value = true;
      Get.offAllNamed('/home'); // Navigasi ke halaman utama
    } else {
      Get.snackbar("Login Gagal", "Email atau Password salah.");
    }
  }

  // Method untuk logout
  Future<void> logout() async {
    isLoggedIn.value = false;
    Get.offAllNamed('/login'); // Kembali ke halaman login setelah logout
  }
}
