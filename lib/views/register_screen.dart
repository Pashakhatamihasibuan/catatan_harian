import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';
import '../themes/colors_themes.dart';
import '../themes/fonts_themes.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: (isLandscape)
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.098),
                    Image.asset(
                      "assets/images/pena.png",
                      width: size.width * (210 / 844),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: size.height * (36 / 390),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daftar Aplikasi Catatan Harian",
                          style: boldTextJakartaSans.copyWith(
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.011,
                        ),
                        Text(
                          "Buat akun catatan harian untuk bisa mengakses catatan!",
                          style: regularTextPoppins.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: size.height * (53 / 844),
                        ),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: mediumTextPoppins.copyWith(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: mediumTextPoppins.copyWith(
                              fontSize: 14,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: borderFieldColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: borderFieldColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.035),
                        TextField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          style: mediumTextPoppins.copyWith(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: mediumTextPoppins.copyWith(
                              fontSize: 14,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: borderFieldColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: borderFieldColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.099),
                        Container(
                          height: size.height * (100 / 844),
                          width: size.width * 0.91,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {
                              registerController.register(
                                emailController.text,
                                passwordController.text,
                              );
                            },
                            child: Text(
                              'Daftar',
                              style: boldTextPoppins.copyWith(
                                fontSize: size.width * (16 / 844),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.055),

                        // * Tombol Masuk
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sudah punya akun? ",
                              style: regularTextPoppins.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offNamed(
                                    '/login'); // Navigasi ke halaman register
                              },
                              child: Text(
                                "Masuk",
                                style: semiBoldTextPoppins.copyWith(
                                  fontSize: 14,
                                  color: lightPurpleColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.083),
                      ],
                    ),
                  ],
                ),
              )

            // TODO: Potrait mode
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.098),
                    Image.asset(
                      "assets/images/pena.png",
                      width: size.width * (210 / 390),
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      height: size.height * (36 / 844),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daftar Aplikasi\nCatatan Harian",
                          style: boldTextJakartaSans.copyWith(
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.011,
                        ),
                        Text(
                          "Buat akun catatan harian untuk bisa mengakses catatan!",
                          style: regularTextPoppins.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: size.height * (33 / 844),
                        ),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: mediumTextPoppins.copyWith(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: mediumTextPoppins.copyWith(
                              fontSize: 14,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: borderFieldColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: borderFieldColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.035),
                        TextField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          style: mediumTextPoppins.copyWith(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: mediumTextPoppins.copyWith(
                              fontSize: 14,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: borderFieldColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: borderFieldColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.059),
                        Container(
                          height: size.height * (48 / 844),
                          width: size.width * 0.91,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextButton(
                            onPressed: () {
                              registerController.register(
                                emailController.text,
                                passwordController.text,
                              );
                            },
                            child: Text(
                              'Daftar',
                              style: boldTextPoppins.copyWith(
                                fontSize: size.width * (14 / 390),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.035),

                        // * Tombol Masuk
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sudah punya akun? ",
                              style: regularTextPoppins.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offNamed(
                                    '/login'); // Navigasi ke halaman register
                              },
                              child: Text(
                                "Masuk",
                                style: semiBoldTextPoppins.copyWith(
                                  fontSize: 14,
                                  color: lightPurpleColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
