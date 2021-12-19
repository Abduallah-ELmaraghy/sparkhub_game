import 'package:flutter/material.dart';
import 'package:sparkhub_game/constants/style.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              gameName,
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 90.0),
                child: Image.asset(
                  "assets/logo.png",
                  width: 120,
                  height: 120,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: kButtonColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //Navigator.pushNamed(context, '/');
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(15.0),
                        primary: kBackground,
                        textStyle: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      child: const Text(
                        "Start Game",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
