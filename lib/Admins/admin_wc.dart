import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sparkhub_game/providers/wordconnect_provider.dart';

class AdminWc extends StatefulWidget {
  const AdminWc({Key? key}) : super(key: key);

  @override
  _AdminWcState createState() => _AdminWcState();
}

class _AdminWcState extends State<AdminWc> {
  final _formkey = GlobalKey<FormState>();
  final MapLetterController = TextEditingController();
  final WordMapController1 = TextEditingController();
  final WordMapController2 = TextEditingController();
  final WordMapController3 = TextEditingController();
  final WordMapController4 = TextEditingController();
  final WordMapController5 = TextEditingController();
  final WordMapController6 = TextEditingController();

  List<Map<String, String>> wordsMap = [
    {
      "YEMEK": "3,9,15,21,27",
      "EMEK": "14,15,16,17",
      "YEM": "3,4,5",
    }
  ];

//  CollectionReference users = FirebaseFirestore.instance.collection('word_connect');

//    Future<void> addUser() {
//       // Call the user's CollectionReference to add a new user
//       return users
//           .add({
//             'Wordmap': mycontroller.text, // John Doe
//            })
//           .then((value) => print("Recorded"))
//           .catchError((error) => print("Failed to add record: $error"));
//     }

  printasdlast() {
    print("hlhkllh : ${MapLetterController.text}");
  }

  void initState() {
    super.initState();
    MapLetterController.addListener(printasdlast);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Word Connect Admin",
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.length != 0) {
                      return 'Length Must be equal 5';
                    }
                    return null;
                  },
                  autofocus: false,
                  style: new TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Map Letter',
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                  ),
                  controller: MapLetterController,
                ),
                Row(children: [
                  Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Invalid';
                          }
                          return null;
                        },
                        autofocus: true,
                        style: new TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Word Map Number 1',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        controller: WordMapController1,
                      ),
                      width: 200),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Invalid';
                          }
                          return null;
                        },
                        autofocus: true,
                        style: new TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Index 1',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        controller: WordMapController2,
                      ),
                      width: 100),
                ]),
                Row(children: [
                  Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Invalid';
                          }
                          return null;
                        },
                        autofocus: true,
                        style: new TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Word Map Number 2',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        controller: WordMapController3,
                      ),
                      width: 200),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Invalid';
                          }
                          return null;
                        },
                        autofocus: true,
                        style: new TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Index 2',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        controller: WordMapController4,
                      ),
                      width: 100),
                ]),
                Row(children: [
                  Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Invalid';
                          }
                          return null;
                        },
                        autofocus: true,
                        style: new TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Word Map Number 3',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        controller: WordMapController5,
                      ),
                      width: 200),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Invalid';
                          }
                          return null;
                        },
                        autofocus: true,
                        style: new TextStyle(
                            fontWeight: FontWeight.normal, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Index 3',
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                        controller: WordMapController6,
                      ),
                      width: 100),
                ]),

                ///controller: mycontroller,

                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        printasdlast();
                        List<Map<String, String>> wordsMap = [
                          {
                            WordMapController1.text: WordMapController2.text,
                            WordMapController3.text: WordMapController4.text,
                            WordMapController5.text: WordMapController6.text,
                          }
                        ];

                        //Provider.of<WordConnect>(context, listen: false)
                        //   .addMapLetterController(MapLetterController.text);

                        Provider.of<WordConnectProvider>(context, listen: false)
                            .addWordMapController(
                                wordsMap, MapLetterController.text);
 ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),);
//context.watch<WordConnect>().addWordmap(mycontroller.text);

                      }
                    },
                    child: Text("Submit"))
              ],
            )));
  }
}
