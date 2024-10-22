import 'package:app_catatan_harian/themes/colors_themes.dart';
import 'package:app_catatan_harian/themes/fonts_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../controllers/note_controller.dart';

class HomeScreen extends StatelessWidget {
  final LoginController loginController = Get.find();
  final NoteController noteController = Get.put(NoteController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(size, isLandscape),
      body: _buildBody(size, isLandscape),
    );
  }

  AppBar _buildAppBar(Size size, bool isLandscape) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Image.asset(
          "assets/logo/logos.png",
          scale: isLandscape ? 1.4 : 1.2,
        ),
      ),
      title: Text(
        'Catatan Harian',
        style: boldTextJakartaSans.copyWith(
          fontSize: size.width * (isLandscape ? 14 / 390 : 22 / 390),
          color: titleColor,
        ),
      ),
      centerTitle: false,
      actions: [
        _buildLogoutButton(size),
        SizedBox(width: size.width * (24 / 390)),
        _buildAddNoteButton(size),
      ],
    );
  }

  InkWell _buildLogoutButton(Size size) {
    return InkWell(
      onTap: () {
        loginController.logout();
      },
      child: Image.asset(
        "assets/icons/logout.png",
        width: size.width * (size.width > 390 ? 24 / 390 : 18 / 844),
      ),
    );
  }

  InkWell _buildAddNoteButton(Size size) {
    return InkWell(
      onTap: () {
        Get.toNamed('/add_note');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Image.asset(
          "assets/icons/add.png",
          width: size.width * (size.width > 390 ? 24 / 390 : 20 / 844),
        ),
      ),
    );
  }

  Widget _buildBody(Size size, bool isLandscape) {
    return Obx(() {
      if (noteController.notes.isEmpty) {
        return Center(
          child: Text(
            'Belum ada catatan',
            style: semiBoldTextPoppins.copyWith(
              fontSize: size.width * (size.width > 390 ? 18 / 390 : 24 / 390),
            ),
          ),
        );
      }
      return ListView.builder(
        itemCount: noteController.notes.length,
        itemBuilder: (context, index) {
          final note = noteController.notes[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * (16 / 390)),
              padding: EdgeInsets.symmetric(vertical: size.height * (10 / 844)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: borderFieldColor,
                ),
              ),
              child: ListTile(
                title: Text(
                  note.title,
                  style: semiBoldTextPoppins.copyWith(
                    fontSize: size.width * (isLandscape ? 24 / 844 : 16 / 390),
                    color: titleColor,
                  ),
                ),
                subtitle: _buildNoteSubtitle(size, note, isLandscape),
                trailing: InkWell(
                  onTap: () {
                    noteController.deleteNote(note.id);
                  },
                  child: Image.asset(
                    "assets/icons/remove.png",
                    scale: 1.2,
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }

  Column _buildNoteSubtitle(Size size, note, bool isLandscape) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: size.height * (2 / 290)),
        Text(
          note.content,
          style: regularTextPoppins.copyWith(
            fontSize: size.width * (isLandscape ? 18 / 844 : 12 / 390),
            color: greyColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Kategori: ${note.category}',
          style: lightTextPoppins.copyWith(
            fontSize: size.width * (isLandscape ? 18 / 844 : 12 / 390),
            color: lightGreyColor,
          ),
        ),
      ],
    );
  }
}
