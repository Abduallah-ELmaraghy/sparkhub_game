import 'package:flutter/material.dart';
import '../models/memory_game_levels_model.dart';
import '../constants/style.dart';

Details details = Details();

class LevelsPage extends StatefulWidget {
  const LevelsPage({Key? key}) : super(key: key);

  @override
  LevelsPageState createState() => LevelsPageState();
}

class LevelsPageState extends State<LevelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: const Text("Memory game"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 200,
                width: 400,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      details.setSelectedlevel(0);
                      Navigator.pushNamed(context, "/memoeryGameHomeScreen");
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'EASY',
                        style: TextStyle(
                            fontFamily: "Font1",
                            fontSize: 40,
                            fontWeight: FontWeight.normal),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: details.genratestar(1),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                )),
            Container(
              height: 200,
              width: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    details.setSelectedlevel(1);
                    Navigator.pushNamed(context, "/memoeryGameHomeScreen");
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'MEDIUM',
                      style: TextStyle(
                          fontFamily: "Font1",
                          fontSize: 40,
                          fontWeight: FontWeight.normal),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: details.genratestar(2),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              width: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      details.setSelectedlevel(2);
                      Navigator.pushNamed(context, "/memoeryGameHomeScreen");
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Hard',
                        style: TextStyle(
                            fontFamily: "Font1",
                            fontSize: 40,
                            fontWeight: FontWeight.normal),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: details.genratestar(3),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )),
            ),
          ],
        ));
  }
}
