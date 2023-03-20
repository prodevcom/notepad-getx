import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:notepad/src/system/routes.dart';

class LoginController extends GetxController {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  void doLogin() async {
    if (!formKey.currentState!.validate()) return;
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAllNamed(AppPages.home);
    } on FirebaseAuthException {
      // TODO: Fazer os casos de Erro
      Get.showSnackbar(
        const GetSnackBar(
          message: "Usuário e senha inválidos",
          duration: Duration(seconds: 2),
        ),
      );
    } catch (error) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "Erro Genérico",
          duration: Duration(seconds: 2),
        ),
      );
    }
    isLoading.value = false;
  }
}
