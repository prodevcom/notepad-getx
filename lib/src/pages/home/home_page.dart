import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';

import 'package:notepad/src/system/routes.dart';

class HomePage extends StatelessWidget {
  static String id = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth auth = FirebaseAuth.instance;
            auth.signOut();

            Get.offNamed(AppPages.login);
          },
          child: const Text("Sair"),
        ),
      ),
    );
  }
}
