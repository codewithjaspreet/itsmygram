import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:itsmygram/Screens/login_screen.dart';
import 'package:itsmygram/responsive/responsive_layout_screen.dart';
import 'package:itsmygram/utils/colors.dart';
import 'package:itsmygram/responsive/mobile_screen_layout.dart';
import 'package:itsmygram/responsive/web_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyB0iHpn4ZOw0ZMZPReRhv8ezGdpeIWP0YQ',
      appId: "1:641470750659:web:112315450680a4225d2776",
      messagingSenderId: '641470750659',
      projectId: "its-mygram",
      storageBucket: "its-mygram.appspot.com",
    ));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ItsMyGram',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: LoginScreen(),
      // home: const ResponsiveLayout(
      //     mobileScreenLayout: MobileScreenLayout(),
      //     webScreenLayout: WebScreenLayout()),
    );
  }
}
