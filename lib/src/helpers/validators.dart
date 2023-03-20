extension StringExtensions on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

abstract class ValidatorHelper {
  ValidatorHelper._();

  static bool _exists(String? value) {
    return (value == null || value.isEmpty);
  }

  static String? validateName(String? name) {
    if (_exists(name)) {
      return "Digite seu nome";
    }

    if (name!.trim().split(" ").length < 2) {
      return "Digite seu nome e sobrenome";
    }

    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Digite seu e-mail";
    }

    if (!email.isValidEmail()) {
      return "Digite um e-mail válido";
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Preencha sua senha";
    }

    if (password.length < 6) {
      return "Sua senha deve conter no mínimo 6 caracteres";
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? checkPassword, {
    required String password,
  }) {
    if (checkPassword == null || checkPassword.isEmpty) {
      return "Preencha sua confirmação senha";
    }

    if (checkPassword != password) {
      return "A senhas preenchidas não conferem!";
    }

    return null;
  }
}
