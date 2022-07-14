import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_withfirebase/screens/home_screen.dart';
import 'package:notes_app_withfirebase/screens/login_screen.dart';
import 'package:notes_app_withfirebase/screens/register_screen.dart';

import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/register": (context) => Register(),
        "/login": (context) => Login(),
        "/home": (context) => Home(),
      },
      home: Register(),
    );
  }
}
