import 'dart:html';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webadmin/Views/screens/main_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isAndroid = defaultTargetPlatform == TargetPlatform.android;

  await Firebase.initializeApp(
    options: isAndroid || kIsWeb
        ? FirebaseOptions(
        apiKey: "AIzaSyAadeXNQjnw8SOPgjHfkzu36hj2gn701ro",
        authDomain: "webadmin-e8d1a.firebaseapp.com",
        projectId: "webadmin-e8d1a",
        storageBucket: "webadmin-e8d1a.appspot.com",
        messagingSenderId: "295698182170",
        appId: "1:295698182170:web:3f9802eaf54575537561a3"
    )
        : DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      builder:EasyLoading.init(),
    );
  }
}




