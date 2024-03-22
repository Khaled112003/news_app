import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';

import 'package:flutter_application_1/screans4/homepage.dart';
import 'package:flutter_application_1/screans4/newspage.dart';

import 'package:flutter_application_1/screans4/signup.dart';




import 'package:flutter_application_1/service/newsservice.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(news());
  newsservice().getnews();
  
}

class news extends StatelessWidget {
  const news({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'homepage': (context) => (homepage()),
         'newspage': (context) => (newspage()),
          'signin': (context) => (Signup()),
      },
      initialRoute: 'signin',
    );
  }
}
