import 'package:flutter/material.dart';
import 'package:sparkhub_game/constants/style.dart';

import '../providers/memory_game_provider.dart';

class MyAdminHomePage extends StatefulWidget {
  const MyAdminHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyAdminHomePage> createState() => _MyAdminHomePageState();
}

class _MyAdminHomePageState extends State<MyAdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              AdminName,
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 50.0),
                child: Image.asset(
                  "assets/logo.png",
                  width: 80,
                  height: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/admin_wordconnect');
                    },
                    child: const Text("Word Connect",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF101324))),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      primary: kButtonColor,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      minimumSize: const Size(210, 50),
                      maximumSize: const Size(210, 50),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/match');
                    },
                    child: const Text("Matching",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF101324))),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      primary: kButtonColor,
                      minimumSize: const Size(210, 50),
                      maximumSize: const Size(210, 50),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/admin_memoryGame');
                    },
                    child: const Text("Remmember Places",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF101324))),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      primary: kButtonColor,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      minimumSize: const Size(210, 50),
                      maximumSize: const Size(210, 50),
                    )),
              ),
              
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
