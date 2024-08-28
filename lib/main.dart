import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skin_detection_system/mobile_phone_ui/splashScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCmnSZRmoDXgPFhrnQySClEBwj4dKbMurA",
            appId: "1:683724291000:web:fdcbc72c15e4a93d182d4d",
            messagingSenderId: "683724291000",
            projectId: "skin-disease-detection-s-57573"));
  } else if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC-wyIWXjEnGPFPyMLvpir_JrtoMykwqKg",
            appId: "1:683724291000:android:c92f93f4f82f7afb182d4d",
            messagingSenderId: "683724291000",
            projectId: "skin-disease-detection-s-57573",
            storageBucket: "skin-disease-detection-s-57573.appspot.com"));
  } else if (Platform.isIOS) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAq4I1Rbl1cjSvNlCk5CjVAacw46UeQZiY",
            appId: "1:683724291000:ios:67b9a0c7d75d3c02182d4d",
            messagingSenderId: "683724291000",
            projectId: "skin-disease-detection-s-57573",
            storageBucket: "skin-disease-detection-s-57573.appspot.com"));
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Splash(),
    );
  }
}
