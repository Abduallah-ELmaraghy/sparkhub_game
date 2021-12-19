import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sparkhub_game/screens/home.dart';
import 'package:sparkhub_game/screens/login.dart';
import 'package:sparkhub_game/screens/matching_game.dart';
import 'package:sparkhub_game/screens/memory_game_home_screen.dart';
import 'package:sparkhub_game/screens/memory_game_levels_screen.dart';

//import 'screens/levels_screen.dart';
//import 'screens/memory_game_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/home': (context) => const MyHomePage(
              title: '',
            ),
        '/match': (context) => MatchingGame(),
        '/MemoryGameLevelsPage': (context) => const LevelsPage(),
        '/memoeryGameHomeScreen': (context) => const MemoryGameHomeScreen(),
      },
      home: AnimatedSplashScreen(
        duration: 1500,
        splash: Image.asset(
          "assets/logo.png",
        ),
        nextScreen: const MyHomePage(
          title: '',
        ),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: const Color(0xff101324),
      ),
      debugShowCheckedModeBanner: false,
    );

    /* return MaterialApp(initialRoute: '/MemoryGameLevelsPage', routes: {
      '/MemoryGameLevelsPage': (context) => const LevelsPage(),
      '/memoeryGameHomeScreen': (context) => const MemoryGameHomeScreen(),
    });*/
  }
}
