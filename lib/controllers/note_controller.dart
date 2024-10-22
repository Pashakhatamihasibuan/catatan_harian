import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/note_models.dart';

class NoteController extends GetxController {
  var notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotes(); // Memuat catatan saat controller diinisialisasi
  }

  // Menambahkan catatan baru
  void addNote(String title, String content, String category) {
    final note = Note(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      content: content,
      category: category, // Menambahkan kategori
    );
    notes.add(note);
    saveNotes(); // Simpan catatan ke storage lokal
  }

  // Menghapus catatan
  void deleteNote(String id) {
    notes.removeWhere((note) => note.id == id);
    saveNotes(); // Simpan perubahan ke storage lokal
  }

  // Simpan catatan ke local storage (SharedPreferences)
  Future<void> saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notesString =
        notes.map((note) => jsonEncode(note.toMap())).toList();
    await prefs.setStringList('notes', notesString);
  }

  // Memuat catatan dari local storage
  Future<void> loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notesString = prefs.getStringList('notes');

    // Periksa apakah data tidak null atau kosong
    if (notesString != null && notesString.isNotEmpty) {
      try {
        notes.value = notesString
            .map((noteStr) => Note.fromMap(jsonDecode(noteStr)))
            .toList();
      } catch (e) {
        print("Error decoding notes: $e");
        // Anda bisa menambahkan mekanisme fallback atau error handling di sini
      }
    }
  }
}
