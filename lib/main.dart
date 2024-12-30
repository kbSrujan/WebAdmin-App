import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webadmin/Views/screens/main_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isAndroid = defaultTargetPlatform == TargetPlatform.android;

  await Firebase.initializeApp(
    options: isAndroid || kIsWeb
        ? FirebaseOptions(
            apiKey: 'AIzaSyC5gAeVhXajzRJEVeE19Wsl1fEK8GiRScA',
            appId: '1:684384820410:web:f3fda49be7820a7c1a3683',
            messagingSenderId: '684384820410',
            projectId: 'uberclone-d6cc2',
            authDomain: 'uberclone-d6cc2.firebaseapp.com',
            storageBucket: 'uberclone-d6cc2.appspot.com',
            measurementId: 'G-N0QGSB8HZ6',
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
      builder: EasyLoading.init(),
    );
  }
}
