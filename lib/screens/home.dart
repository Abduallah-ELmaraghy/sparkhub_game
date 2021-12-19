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
                      // Navigator.pushNamed(context, '/match');
                    },
                    child: const Text("Word Connect"),
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
                        style: TextStyle(fontWeight: FontWeight.bold)),
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
                      Navigator.pushNamed(context, '/memoeryGameHomeScreen');
                    },
                    child: const Text("Remmember Places"),
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
