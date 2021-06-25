import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobil_projem/app/splash_screen.dart';
import 'package:mobil_projem/locator.dart';
import 'package:mobil_projem/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        title: "Pati Buldum",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
