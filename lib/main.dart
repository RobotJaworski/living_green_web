import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:lg_admin/config/config.dart';

import 'package:lg_admin/providers/imageRecogntionProvider.dart';
import 'package:lg_admin/providers/traderProvider.dart';
import 'package:lg_admin/providers/postPageProvider.dart';
import 'package:lg_admin/admin/splashScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LivingPlant.firebaseAuth = FirebaseAuth.instance;
  LivingPlant.firebaseFirestore = FirebaseFirestore.instance;
  LivingPlant.firebaseStorage = FirebaseStorage.instance;
  LivingPlant.sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<postPageProvider>(
          create: (_) => postPageProvider(),
        ),
        ListenableProvider<imageRecogntionProvider>(
          create: (_) => imageRecogntionProvider(),
        ),
        ListenableProvider<traderProvider>(
          create: (_) => traderProvider(),
        ),
        // ChangeNotifierProvider<traderProvider>(
        //   create: (_) => traderProvider(),
        // )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: LivingPlant.primaryColor,
            ),
      ),
      home: const splashScreen(),
    );
  }
}
