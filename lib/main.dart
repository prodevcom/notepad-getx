import 'dart:async';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';

import 'package:notepad/firebase_options.dart';
import 'package:notepad/src/system/routes.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    var options = DefaultFirebaseOptions.currentPlatform;
    await Firebase.initializeApp(options: options);
    runApp(const MyApp());
  }, (exception, stack) {
    FirebaseCrashlytics.instance.recordError(exception, stack);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NotePad',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutes.initialRoute,
      getPages: PageRoutes.pages,
    );
  }
}
