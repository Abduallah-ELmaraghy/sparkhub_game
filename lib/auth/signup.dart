import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sparkhub_game/auth/data_validation.dart';

import 'auth.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var myusername, mypassword, myemail;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      onSaved: (val) {
                        myusername = val;
                      },
                      validator: (val) {
                        if (checkLength(val!)) {
                          return "username length is not valid";
                        }
                        if (isNull(val)) {
                          return "username can't be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "username",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onSaved: (val) {
                        myemail = val;
                      },
                      validator: (val) {
                        if (isEmail(val!)) {
                          return "Email format is not valid";
                        }
                        if (checkLength(val)) {
                          return "Email length is not valid";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "email",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      onSaved: (val) {
                        mypassword = val;
                      },
                      validator: (val) {
                        if (val!.length < 6) {
                          return "Password can't to be less than 6 letter";
                        }
                        if (checkPassword(val)) {
                          return "weak Password, Password should contain one Uppercase charracter, one ";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "password",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Text("if you have Account "),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("/login");
                              },
                              child: Text(
                                "Click Here",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        )),
                    Container(
                        child: ElevatedButton(
                      onPressed: () async {
                        UserCredential response = await Authentication().signUp(
                            formstate: formstate,
                            myemail: myemail,
                            mypassword: mypassword,
                            uname: myusername);
                        print("===================");
                        if (response != null) {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .add({"username": myusername, "email": myemail});
                          Navigator.of(context).pushReplacementNamed("/home");
                        } else {
                          print("Sign Up Faild");
                        }
                        print("===================");
                      },
                      child: Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
