import 'package:flutter/material.dart';
import 'package:sparkhub_game/constants/style.dart';

class MyHomeScreenPage extends StatefulWidget {
  const MyHomeScreenPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomeScreenPage> createState() => _MyHomeScreenPageState();
}

class _MyHomeScreenPageState extends State<MyHomeScreenPage> {
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
              ElevatedButton(
                  onPressed: () {
                   Navigator.pushNamed(context, '/wchome');
                  },
                  child: const Text("Word Connect")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/match');
                  },
                  child: const Text("Matching",
                      style: TextStyle(fontWeight: FontWeight.bold))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/memoeryGameHomeScreen');
                  },
                  child: const Text("Remmember Places")),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
