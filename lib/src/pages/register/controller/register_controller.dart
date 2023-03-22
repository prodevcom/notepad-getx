import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:notepad/src/system/routes.dart';

class RegisterController extends GetxController {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final checkPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      var authorization = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (authorization.user != null) {
        authorization.user!.updateDisplayName(nameController.text);
        Get.offAllNamed(AppPages.home);
      }
    } on FirebaseAuthException catch (error) {
      String erro = "Erro genérico";
      if (error.code == 'email-already-in-use') {
        erro = "E-mail já cadastrado!";
      }
      Get.showSnackbar(
        GetSnackBar(
          message: erro,
          duration: const Duration(seconds: 2),
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
