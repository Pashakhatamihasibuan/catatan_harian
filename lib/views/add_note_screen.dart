import 'package:app_catatan_harian/themes/colors_themes.dart';
import 'package:app_catatan_harian/themes/fonts_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';

// ignore: must_be_immutable
class AddNoteScreen extends StatelessWidget {
  final NoteController noteController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // Daftar kategori
  final List<String> categories = [
    'Pekerjaan',
    'Pribadi',
    'Sekolah',
    'Lainnya'
  ];
  String? selectedCategory;

  AddNoteScreen({super.key}); // Variabel untuk menyimpan kategori yang dipilih

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              "assets/icons/arrow_back.png",
            ),
          ),
        ),
        title: Text(
          'Tambahkan Catatan',
          style: boldTextJakartaSans.copyWith(
            fontSize: size.width * (16 / 390),
            color: titleColor,
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          bool isPortrait = orientation == Orientation.portrait;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isPortrait)
                    Center(
                      child: Image.asset(
                        "assets/images/book.png",
                        width: size.width * (251 / 390),
                      ),
                    ),
                  if (!isPortrait)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/book.png",
                          width: size.width * (125 / 390),
                        ),
                      ],
                    ),
                  SizedBox(
                    height: size.height * (42 / 844),
                  ),
                  TextField(
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    style: mediumTextPoppins.copyWith(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Judul',
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
                  SizedBox(height: size.height * (22 / 844)),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 12), // Untuk memberikan ruang untuk label
                    child: TextField(
                      controller: contentController,
                      keyboardType: TextInputType.multiline,
                      style: mediumTextPoppins.copyWith(
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        labelText: "Keterangan",
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
                      maxLines: 5,
                    ),
                  ),
                  SizedBox(height: size.height * (22 / 844)),
                  DropdownButtonFormField<String>(
                    elevation: 4,
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
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
                    items: categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: (isPortrait)
                            ? Text(
                                category,
                                style: mediumTextPoppins.copyWith(
                                  fontSize: size.width * (14 / 390),
                                ),
                              )
                            : Text(
                                category,
                                style: mediumTextPoppins.copyWith(
                                  fontSize: size.width * (14 / 844),
                                ),
                              ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      selectedCategory = value;
                    },
                    value: selectedCategory,
                    hint: (isPortrait)
                        ? Text(
                            'Pilih Kategori',
                            style: mediumTextPoppins.copyWith(
                              fontSize: size.width * (18 / 844),
                            ),
                          )
                        : Text(
                            'Pilih Kategori',
                            style: mediumTextPoppins.copyWith(
                              fontSize: size.width * (18 / 390),
                            ),
                          ),
                  ),
                  SizedBox(height: size.height * (54 / 844)),
                  Center(
                    child: (isPortrait)
                        ? Container(
                            height: size.height * (48 / 844),
                            width: size.width * 0.99,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Validasi input
                                if (titleController.text.isNotEmpty &&
                                    contentController.text.isNotEmpty &&
                                    selectedCategory != null) {
                                  // Tambahkan catatan baru dengan kategori
                                  noteController.addNote(
                                    titleController.text,
                                    contentController.text,
                                    selectedCategory!,
                                  );
                                  // Kembali ke halaman utama setelah menambahkan catatan
                                  Get.back();
                                } else {
                                  // Tampilkan pesan error jika ada field yang kosong
                                  Get.snackbar(
                                    'Error',
                                    'Title, content, and category cannot be empty.',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              child: Text(
                                'Tambahkan Catatan',
                                style: mediumTextPoppins.copyWith(
                                  fontSize: size.width * (14 / 390),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: size.height * (55 / 390),
                            width: size.width * 0.99,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Validasi input
                                if (titleController.text.isNotEmpty &&
                                    contentController.text.isNotEmpty &&
                                    selectedCategory != null) {
                                  // Tambahkan catatan baru dengan kategori
                                  noteController.addNote(
                                    titleController.text,
                                    contentController.text,
                                    selectedCategory!,
                                  );
                                  // Kembali ke halaman utama setelah menambahkan catatan
                                  Get.back();
                                } else {
                                  // Tampilkan pesan error jika ada field yang kosong
                                  Get.snackbar(
                                    'Error',
                                    'Title, content, and category cannot be empty.',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              },
                              child: (isPortrait)
                                  ? Text(
                                      'Tambahkan Catatan',
                                      style: mediumTextPoppins.copyWith(
                                        fontSize: size.width * (12 / 390),
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      'Tambahkan Catatan',
                                      style: mediumTextPoppins.copyWith(
                                        fontSize: size.width * (16 / 844),
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
