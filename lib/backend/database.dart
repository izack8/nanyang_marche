import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {

  final CollectionReference userColl =
  FirebaseFirestore.instance.collection("users");

  Future<void> createUserData(String name, String email, String uid) async {
     await userColl.doc(uid).set({'name': name, 'email': email, 'user_id': uid});
     await FirebaseFirestore.instance.collection("you_Collection_Path").add({
       "key":"products" //your data which will be added to the collection and collection will be created after this
     }).then((_){
       print("collection created");
     }).catchError((_){
       print("an error occured");
     });

  }

  Future updateUserList(String name, String gender, int score, String uid) async {
    return await userColl.doc(uid).update({
      'name': name, 'gender': gender, 'score': score
    });
  }

  Future addNewUser(String uid, String name, String ) async {
    return;
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await userColl.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}