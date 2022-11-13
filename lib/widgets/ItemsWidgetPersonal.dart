import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanyang_marche/models/users.dart';
import 'package:nanyang_marche/models/products.dart';
import 'package:nanyang_marche/backend/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanyang_marche/pages/ProductPage.dart';

class ItemsWidgePersonal extends StatelessWidget {
  Products products = Products(
      imgURL: "imgURL",
      pro_desc: "pro_desc",
      pro_name: "pro_name",
      pro_price: "pro_price",
      product_id: "product_id");

  @override
  Widget build(BuildContext context) {
    List imgURL_list = [];
    List name_list = [];
    List price_list = [];
    List desc_list = [];
    var user_id = DatabaseManager().getUserId().toString();


    //final pathReference = storageRef.child("images/stars.jpg");
    String url = "assets/images/$user_id/";
    Future awaitLists = FirebaseFirestore.instance
        .collection("users")
        .doc(user_id.toString())
        .collection("products")
        .get()
        .then(
          (res) async {
        for (var element in res.docs) {
          final imgURL = await FirebaseStorage.instance
              .ref()
              .child(url + element.id.toString())
              .getDownloadURL();

          try {
            imgURL_list.add(imgURL);
            name_list.add(element.get('pro_name'));
            desc_list.add(element.get('pro_desc'));
            price_list.add(element.get('pro_price'));

          } on FirebaseException catch (e) {
            // Handle any errors.
          }
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

    return FutureBuilder(
      future: awaitLists,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GridView.count(
            childAspectRatio: 0.68,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < imgURL_list.length!; i++)
                Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.more_horiz,
                            color: Color(0xFF072E54),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {

                          ProductPage.user_name = FirebaseFirestore.instance.collection("users").doc(
                              FirebaseAuth.instance.currentUser?.uid.toString()
                          ).get();
                          ProductPage.imgURL = imgURL_list[i];
                          ProductPage.p_desc = desc_list[i];
                          ProductPage.p_name = name_list[i];
                          ProductPage.p_price = price_list[i];

                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => const ProductPage(),
                            ),
                          );

                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image.network(
                            imgURL_list[i],
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          name_list[i],
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF072E54),
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          desc_list[i],
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF072E54),
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              price_list[i],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF072E54),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}