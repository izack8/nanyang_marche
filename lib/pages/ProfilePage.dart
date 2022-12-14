import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanyang_marche/models/users.dart';
import 'package:nanyang_marche/widgets/ItemsWidgetPersonal.dart';
import 'package:nanyang_marche/models/products.dart';
import 'package:nanyang_marche/backend/database.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{

  final storageRef = FirebaseStorage.instance.ref();
  Users user_details = Users(name:"isaacccc",email: "email",uid: 'user_id');

  Future retrieveData() async{
    var usr_id = DatabaseManager().getUserId().toString();
    final ref = FirebaseFirestore.instance.collection("users").doc(usr_id).withConverter(
      fromFirestore: Users.fromFirestore,
      toFirestore: (Users users, _) => users.toFirestore(),
    );
    final docSnap = await ref.get();
    final users = docSnap.data();
    if (users != null) {
      user_details = Users(name:users.name,email: users.email,uid: users.uid);
      print(user_details.name);
    } else {
      print("No such document.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: retrieveData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Color(0xfff6f1e4),
              body: SafeArea(
                  child: Center(
                    child: ListView(
                        children: [Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('assets/images/isaac.jpg'),
                            ),
                            Text(
                              user_details.name, //name
                              style: const TextStyle(
                                fontSize: 40.0,
                                color: Colors.black,
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
                                Center(
                                  child: Text(
                                    '      Posts 0               ',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      letterSpacing: 2.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'Followers 0',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      letterSpacing: 2.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                              width: 200.0,
                            ),
                            const SizedBox(
                              child: Text(
                                'Your Listings',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  letterSpacing: 2.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                              width: 200.0,
                            ),
                            ItemsWidgePersonal(),

                          ],
                        ),
                        ]),
                  )),
            ),
          );
        }else {
          return CircularProgressIndicator();
        }

      }
    );
  }
}

