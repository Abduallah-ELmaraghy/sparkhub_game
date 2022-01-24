import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/memory_game_data_model.dart';
import '../providers/memory_game_provider.dart';
import 'package:provider/provider.dart';
import '../constants/style.dart';

class MemoryGameAdminScreen extends StatefulWidget {
  const MemoryGameAdminScreen({Key? key}) : super(key: key);

  @override
  MemoryGameAdminScreenState createState() => MemoryGameAdminScreenState();
}

class MemoryGameAdminScreenState extends State<MemoryGameAdminScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreen,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 300,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Column(children: [
          Text(
            "Mange Memory GAME",
            style: TextStyle(color: kDarkGreen),
          ),
          Image.asset(
            "assets/gameIcone.gif",
            fit: BoxFit.fitWidth,
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<MemoryGameProvider>(
          builder: (context, MemoryGameProvider data, child) {
            if (data.getGame.isNotEmpty) {
              return ListView.builder(
                itemCount: data.getGame.length,
                itemBuilder: (context, index) {
                  return GameList(data.getGame[index], index);
                },
              );
            } else {
              return GestureDetector(
                  onTap: () {
                    showAlertDialog(context);
                  },
                  child: const Center(
                      child: Text(
                    "ADD SOME GAMES NOW",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class GameList extends StatelessWidget {
  final Game game;
  int index;

  GameList(this.game, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: const Icon(Icons.videogame_asset_rounded),
              title: Text(
                "Level:" + game.level,
              ),
              subtitle: Text(
                "Level score:" + game.levelScore,
              ),
              trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    print("Game DELETED");
                    Provider.of<MemoryGameProvider>(context, listen: false)
                        .removeGame(index);
                  }),
            )));
  }
}

showAlertDialog(BuildContext context) {
  TextEditingController _level = TextEditingController();
  TextEditingController _levelScore = TextEditingController();

  // Create button
  Widget okButton = TextButton(
    child: const Text("ADD GAME"),
    onPressed: () {
      context.read<MemoryGameProvider>().addData(_level.text, _levelScore.text);
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog

  AlertDialog alert = AlertDialog(
    title: const Text("ADD A NEW GAME "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _level,
          decoration: const InputDecoration(hintText: "Enter Level"),
        ),
        TextField(
          controller: _levelScore,
          decoration: const InputDecoration(hintText: "Enter Level's Score"),
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}





/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/note.dart';
import '../providers/notes_provider.dart';
import 'package:provider/provider.dart';
import '../constants/style.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text("Mange memory game"),
      ),*/
      backgroundColor: kDarkGreen,
      appBar: AppBar(
          titleSpacing: 0.0,
          toolbarHeight: 200,
          title: Image.asset(
            "assets/gameIcone.gif",
            height: 200,
            width: 500,
            fit: BoxFit.cover,
          )),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          /*Container(
            child: Image.asset(
              "assets/gameIcone.gif",
              height: 200,
              width: 500,
              fit: BoxFit.cover,
            ),
          ),*/
          // ListView(
          //padding: const EdgeInsets.all(8.0),
          ////children: <Widget>[
          ///
          /*Container(
            width: 800,
            height: 200,
            child: Image.asset(
              "assets/gameIcone.gif",
              //height: 300,
              //width: 3000,
              //fit: BoxFit.fill,
            ),
          ),*/
          /*Container(
            height: 200,
            width: 1000,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/gameIcone.gif"),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
          ),*/
          //Container(
          //child:
          Consumer<NotesProvider>(
            builder: (context, NotesProvider data, child) {
              return data.getNotes.length != 0
                  ? ListView.builder(
                      itemCount: data.getNotes.length,
                      itemBuilder: (context, index) {
                        return CardList(data.getNotes[index], index);
                      },
                    )
                  : GestureDetector(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Center(
                          child: Text(
                        "ADD SOME NOTES NOW",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )));
            },
          ),
          //),
          //],
          //),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CardList extends StatelessWidget {
  final Note notes;
  int index;

  CardList(this.notes, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListTile(
              leading: Icon(Icons.videogame_asset_rounded),
              title: Text(
                notes.title,
              ),
              subtitle: Text(
                notes.description,
              ),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    print("HELLO DELETED");
                    Provider.of<NotesProvider>(context, listen: false)
                        .removeNotes(index);
                  }),
            )));
  }
}

showAlertDialog(BuildContext context) {
  TextEditingController _Title = TextEditingController();
  TextEditingController _Description = TextEditingController();
  // Create button
  Widget okButton = TextButton(
    child: Text("ADD NOTE"),
    onPressed: () {
      // Provider.of<NotesProviders>(context, listen: false)
      //     .addNotes(_Title.text, _Description.text);
      //context.read<NotesProvider>().addNotes(_Title.text, _Description.text);
      context.read<NotesProvider>().addData(_Title.text, _Description.text);
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ADD A NEW NOTE "),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _Title,
          decoration: InputDecoration(hintText: "Enter Title"),
        ),
        TextField(
          controller: _Description,
          decoration: InputDecoration(hintText: "Enter Description"),
        ),
      ],
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
*/