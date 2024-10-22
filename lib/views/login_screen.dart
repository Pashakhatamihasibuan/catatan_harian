import 'package:app_catatan_harian/themes/colors_themes.dart';
import 'package:app_catatan_harian/themes/fonts_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * (isLandscape ? 0.06 : 0.04)),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.072),
              Image.asset(
                "assets/logo/logo.png",
                width: isLandscape ? 87 : 77,
                height: isLandscape ? 65 : 55,
              ),
              SizedBox(height: size.height * (isLandscape ? 0.090 : 0.088)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Masuk Aplikasi${isLandscape ? '' : '\n'}Catatan Harian",
                    style: boldTextJakartaSans.copyWith(fontSize: 40),
                  ),
                  SizedBox(height: size.height * 0.011),
                  Text(
                    "Login menggunakan akun yang sudah terdaftar!",
                    style: regularTextPoppins.copyWith(
                        fontSize: isLandscape ? 16 : 14),
                  ),
                  SizedBox(height: size.height * 0.047),
                  _buildTextField(
                      controller: emailController,
                      label: 'Email',
                      isObscure: false),
                  SizedBox(height: size.height * 0.035),
                  _buildTextField(
                      controller: passwordController,
                      label: 'Password',
                      isObscure: true),
                  SizedBox(height: size.height * (isLandscape ? 0.099 : 0.059)),
                  _buildLoginButton(size, isLandscape),
                  SizedBox(height: size.height * 0.045),
                  _buildRegisterRow(),
                  SizedBox(height: size.height * 0.08),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller,
      required String label,
      required bool isObscure}) {
    return TextField(
      controller: controller,
      keyboardType: isObscure
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      obscureText: isObscure,
      style: mediumTextPoppins.copyWith(fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: mediumTextPoppins.copyWith(fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderFieldColor),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderFieldColor),
        ),
      ),
    );
  }

  Widget _buildLoginButton(Size size, bool isLandscape) {
    return Container(
      height: size.height * (isLandscape ? 60 / 390 : 48 / 844),
      width: size.width * 0.91,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: () {
          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
            Get.snackbar(
                "Input Tidak Valid", "Email dan Password tidak boleh kosong.");
          } else {
            // Panggil metode login
            loginController.login(
                emailController.text, passwordController.text);
          }
        },
        child: Text(
          'Login',
          style: boldTextPoppins.copyWith(
            fontSize: size.width * (isLandscape ? 16 / 844 : 16 / 390),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Belum punya akun? ",
            style: regularTextPoppins.copyWith(fontSize: 14)),
        InkWell(
          onTap: () =>
              Get.offNamed('/register'), // Navigasi ke halaman register
          child: Text(
            "Daftar",
            style: semiBoldTextPoppins.copyWith(
                fontSize: 14, color: lightPurpleColor),
          ),
        ),
      ],
    );
  }
}
