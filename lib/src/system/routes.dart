import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';

import 'package:notepad/src/pages/home/home_page.dart';
import 'package:notepad/src/pages/login/binding/login_binding.dart';
import 'package:notepad/src/pages/login/login_page.dart';
import 'package:notepad/src/pages/register/register_page.dart';

import '../pages/register/binding/register_binding.dart';

abstract class AppPages {
  static const String home = "/";
  static const String register = "/register";
  static const String login = "/login";
}

abstract class PageRoutes {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  // Rota Inicial do App
  static String get initialRoute {
    User? user = auth.currentUser;
    log("$user", name: 'Routes');
    return user == null ? AppPages.login : AppPages.home;
  }

  // Rotas Existes do App
  static List<GetPage> pages = [
    GetPage(name: AppPages.home, page: () => const HomePage()),
    GetPage(
      name: AppPages.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppPages.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
