import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:notepad/src/components/custom_text_field.dart';
import 'package:notepad/src/components/scroll_view.dart';
import 'package:notepad/src/helpers/validators.dart';
import 'package:notepad/src/pages/home/home_page.dart';

class RegisterPage extends StatefulWidget {
  static String id = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final checkPasswordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    var authorization = await auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    if (authorization.user != null) {
      authorization.user!.updateDisplayName(nameController.text);
      Navigator.of(this.context).pushReplacementNamed(HomePage.id);
    }
  }

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
          key: formKey,
          child: Column(
            // Todos os filhos vão ser esticados ao máximo do componente na tela!
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: nameController,
                labelText: 'Nome',
                hintText: 'Digite seu nome',
                icon: const Icon(Icons.person),
                textCapitalization: TextCapitalization.words,
                validator: ValidatorHelper.validateName,
              ),
              CustomTextField(
                controller: emailController,
                labelText: 'E-mail',
                hintText: 'Digite seu e-mail',
                icon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: ValidatorHelper.validateEmail,
              ),
              CustomTextField(
                controller: passwordController,
                labelText: 'Senha',
                hintText: 'Digite sua senha',
                icon: const Icon(Icons.lock),
                isSecret: true,
                validator: ValidatorHelper.validatePassword,
              ),
              CustomTextField(
                controller: checkPasswordController,
                labelText: 'Confirmar Senha',
                hintText: 'Digite sua confiração senha',
                icon: const Icon(Icons.lock),
                isSecret: true,
                validator: (checkPassword) {
                  return ValidatorHelper.validateConfirmPassword(
                    checkPassword,
                    password: passwordController.text,
                  );
                },
              ),
              ElevatedButton(
                onPressed: () => register(context),
                child: const Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
