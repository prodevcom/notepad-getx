import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:notepad/src/pages/home/components/float_button.dart';
import 'package:notepad/src/pages/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBarWidget(
        title: controller.displayName,
        signOut: controller.signOut,
      ),
      // TODO: Challenge - Fazer um ListView com ListTile para mostrar as notas
      body: const Center(
        child: Text("oi"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.plus),
        onPressed: () {
          print("Ir para nova nota!");
        },
      ),
    );
  }
}
