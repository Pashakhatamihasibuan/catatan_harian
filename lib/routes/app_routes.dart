import 'package:get/get.dart';
import '../views/add_note_screen.dart';
import '../views/login_screen.dart';
import '../views/register_screen.dart';
import '../views/home_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const addNote = '/add_note';

  static List<GetPage> routes = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: register, page: () => RegisterScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: addNote, page: () => AddNoteScreen()),
  ];
}
