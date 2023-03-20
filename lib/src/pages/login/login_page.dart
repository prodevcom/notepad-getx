import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import 'package:notepad/src/components/button.dart';
import 'package:notepad/src/components/custom_text_field.dart';
import 'package:notepad/src/components/scroll_view.dart';
import 'package:notepad/src/helpers/validators.dart';
import 'package:notepad/src/pages/login/controller/login_controller.dart';
import 'package:notepad/src/system/routes.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSafeScrollView(
        center: true,
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: controller.emailController,
                labelText: 'E-mail',
                hintText: 'Digite seu e-mail',
                icon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: ValidatorHelper.validateEmail,
              ),
              CustomTextField(
                controller: controller.passwordController,
                labelText: 'Senha',
                hintText: 'Digite sua senha',
                icon: const Icon(Icons.lock),
                isSecret: true,
                validator: ValidatorHelper.validatePassword,
              ),
              Obx(() => CustomButton(
                    onPressed: controller.doLogin,
                    isLoading: controller.isLoading.value,
                    child: const Text("Entrar"),
                  )),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Get.toNamed(AppPages.register),
                // Navigator.of(context).pushNamed(RegisterPage.id),
                child: const Text("Cadastre-se"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
