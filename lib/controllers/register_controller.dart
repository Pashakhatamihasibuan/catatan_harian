import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  // Method untuk registrasi pengguna baru
  Future<void> register(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('password', password);
      Get.snackbar("Registrasi Berhasil", "Silakan login.");
      Get.offNamed(
          '/login'); // Navigasi ke halaman login setelah registrasi berhasil
    } else {
      Get.snackbar("Error", "Email dan Password tidak boleh kosong.");
    }
  }
}
