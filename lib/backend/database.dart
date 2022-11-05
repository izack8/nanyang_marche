import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nanyang_marche/models/users.dart';
import 'package:nanyang_marche/models/products.dart';
class DatabaseManager {

  final CollectionReference userColl =
  FirebaseFirestore.instance.collection("users");
  static String? usr_id = FirebaseAuth.instance.currentUser?.uid.toString();
  static String? usr_id_doc = FirebaseFirestore.instance.collection("users").doc(usr_id).toString();

  Future<void> createUserData(String name, String email, String uid) async {
     await userColl.doc(uid).set({'name': name, 'email': email, 'user_id': uid});

  }

  Future createItemData(String p_id, String p_name, String imgurl, String p_desc, String p_price, String uid) async {
    await userColl.doc(uid).collection("products").doc(p_id).set({'product_id': p_id, 'pro_name':p_name,
      'imgURL':imgurl,'pro_desc':'productDesc', 'pro_price':p_price, 'user_id':uid});
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