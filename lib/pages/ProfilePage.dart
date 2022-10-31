import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanyang_marche/models/users.dart';
import 'package:nanyang_marche/models/products.dart';
import 'package:nanyang_marche/backend/database.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{

  final storageRef = FirebaseStorage.instance.ref();
  static String? usr_id = FirebaseAuth.instance.currentUser?.uid.toString();
  final user_id_doc = FirebaseFirestore.instance.collection("users").doc(usr_id);
  Users user_details = Users(name:"distance",email: "email",uid: 'user_id');

  void retrieveData() async{
    final ref = FirebaseFirestore.instance.collection("users").doc(usr_id).withConverter(
      fromFirestore: Users.fromFirestore,
      toFirestore: (Users users, _) => users.toFirestore(),
    );
    final docSnap = await ref.get();
    final users = docSnap.data();
    if (users != null) {
      user_details = Users(name:users.name,email: users.email,uid: users.uid);
      print(user_details.name);
      setState(() {});
    } else {
      print("No such document.");
    }
  }

  @override
  void initState() {
    super.initState();
    retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/isaac.jpg'),
                  ),
                    Text(
                    user_details.name, //name
                    style: const TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MaterialButton(
                      color: Colors.blue,
                      onPressed: retrieveData,
                      child: const Text(
                          "Follow Me",
                          style: TextStyle(
                              color: Colors.white70, fontWeight: FontWeight.bold
                          )
                      ),
                  ),
                  const SizedBox(
                    height: 20.0,
                    width: 200.0,
                  ),
                  Row(
                    children: const [

                      Expanded(
                        flex:1,
                        child: Center(
                          child: Text(
                            'Posts 0',
                            style: TextStyle(
                              // fontFamily: 'SourceSansPro',
                              fontSize: 20.0,
                              color: Colors.greenAccent,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'Followers 0',
                            style: TextStyle(
                              // fontFamily: 'SourceSansPro',
                              fontSize: 20.0,
                              color: Colors.greenAccent,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                    width: 200.0,
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: const Image(image: AssetImage('isaac.jpg')),
                      title: Text(
                        'Brand New Isaac',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: const Image(image: AssetImage('isaac.jpg')),
                      title: Text(
                        'Second-hand Isaac',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: const Image(image: AssetImage('isaac.jpg')),
                      title: Text(
                        'Third-hand Isaac',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            )),
      ),
    );
  }
}

