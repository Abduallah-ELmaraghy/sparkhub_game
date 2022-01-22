import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/note.dart';
import '../providers/notes_provider.dart';
import 'package:provider/provider.dart';
import '../constants/style.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<NotesProvider>(
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
