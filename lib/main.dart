import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sparkhub_game/constants/style.dart';
import 'package:sparkhub_game/models/wcmodels/Constants.dart';
import 'package:sparkhub_game/screens/home.dart';
import 'package:sparkhub_game/screens/login.dart';
import 'package:sparkhub_game/screens/matching_levels.dart';
import 'package:sparkhub_game/screens/memory_game_home_screen.dart';
import 'package:sparkhub_game/screens/memory_game_levels_screen.dart';
import 'package:sparkhub_game/screens/wcscreens/home_page.dart';
import 'package:sparkhub_game/providers/wordconnect_provider.dart';
import 'package:sparkhub_game/Admins/admin_wc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'screens/notes_screen.dart';
import 'providers/notes_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(title: 'Provider Demo', home: Home_Screen()),
    );*/
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/home': (context) => const MyHomePage(
              title: '',
            ),
        '/match': (context) => LevelsPagematch(),
        '/MemoryGameLevelsPage': (context) => const LevelsPage(),
        '/memoeryGameHomeScreen': (context) => const MemoryGameHomeScreen(),
        '/wchome': (context) => HomePage(),
        '/admin_memoryGame': (context) => Home_Screen(),
      },
      home: AnimatedSplashScreen(
        duration: 1500,
        splash: Image.asset(
          "assets/logo.png",
        ),
        //nextScreen: LoginScreen(),
        //nextScreen:  HomePage(),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: kBackground,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
