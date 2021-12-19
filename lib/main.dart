import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sparkhub_game/screens/home.dart';

//import 'screens/memory_game_levels_screen.dart';
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
      home: AnimatedSplashScreen(
        duration: 1500,
        splash: Image.asset(
          "assets/logo.png",
        ),
        nextScreen: const MyHomePage(title: 'Home'),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: const Color(0xff101324),
      ),
      debugShowCheckedModeBanner: false,
    );

    /*return MaterialApp(initialRoute: '/MemoryGameLevelsPage', routes: {
      '/MemoryGameLevelsPage': (context) => const LevelsPage(),
      '/memoeryGameHomeScreen': (context) => const MemoryGameHomeScreen(),
    });*/
  }
}
