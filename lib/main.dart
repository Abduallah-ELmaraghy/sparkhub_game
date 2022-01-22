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

void main() {
  // WordConnect x = WordConnect("Mohamed");
  // x.addMapLetter("mohamed");
   WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
  runApp(
   MultiProvider(
providers: [
ChangeNotifierProvider(create: (context) => WordConnect()), ],

child: MyApp()
 ));
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
        '/match': (context) => LevelsPagematch(),
        '/MemoryGameLevelsPage': (context) => const LevelsPage(),
        '/memoeryGameHomeScreen': (context) => const MemoryGameHomeScreen(),
        '/wchome': (context) => HomePage(),
        
      },
      home: AnimatedSplashScreen(
        duration: 1500,
        splash: Image.asset(
          "assets/logo.png",
        ),
        //nextScreen: LoginScreen(),
        //nextScreen:  HomePage(),
        nextScreen: AdminWc(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: kBackground,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
