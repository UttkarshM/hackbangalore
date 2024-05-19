import 'package:client/screens/app/chatbot_screen.dart';
import 'package:client/screens/app/choose_screen.dart';
import 'package:client/screens/app/fundraiser_pages/details_screen.dart';
import 'package:client/screens/app/home_screen.dart';
import 'package:client/screens/welcome_screen.dart';
import 'package:client/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const DetailsScreen(),
    );
  }
}
