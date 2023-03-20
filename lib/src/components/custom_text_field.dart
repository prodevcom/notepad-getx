import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.icon,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.isSecret = false,
    this.validator,
    this.controller,
  });

  final String labelText;
  final String hintText;
  final Widget? icon;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool isSecret;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          prefixIcon: widget.icon,
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: FaIcon(
                    isObscure
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash,
                  ),
                )
              : null,
        ),
        keyboardType: widget.keyboardType,
        textCapitalization: widget.textCapitalization,
        obscureText: isObscure,
        validator: widget.validator,
      ),
    );
  }
}
