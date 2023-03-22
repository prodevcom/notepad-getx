import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:notepad/src/system/routes.dart';

class HomeController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String get displayName =>
      "Olá, ${auth.currentUser?.displayName?.split(" ").first ?? "Fulan"}";

  void signOut() {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    Get.offNamed(AppPages.login);
  }
}
