import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:notepad/src/components/button.dart';
import 'package:notepad/src/components/custom_text_field.dart';
import 'package:notepad/src/components/scroll_view.dart';
import 'package:notepad/src/helpers/validators.dart';
import 'package:notepad/src/pages/register/controller/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seja bem-vindo'),
        centerTitle: false,
      ),
      body: CustomSafeScrollView(
        center: true,
        child: Form(
          key: controller.formKey,
          child: Column(
            // Todos os filhos vão ser esticados ao máximo do componente na tela!
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: controller.nameController,
                labelText: 'Nome',
                hintText: 'Digite seu nome',
                icon: const Icon(Icons.person),
                textCapitalization: TextCapitalization.words,
                validator: ValidatorHelper.validateName,
              ),
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
              CustomTextField(
                controller: controller.checkPasswordController,
                labelText: 'Confirmar Senha',
                hintText: 'Digite sua confiração senha',
                icon: const Icon(Icons.lock),
                isSecret: true,
                validator: (checkPassword) {
                  return ValidatorHelper.validateConfirmPassword(
                    checkPassword,
                    password: controller.passwordController.text,
                  );
                },
              ),
              Obx(() => CustomButton(
                    onPressed: controller.register,
                    isLoading: controller.isLoading.value,
                    child: const Text("Cadastrar"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
