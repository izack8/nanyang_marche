import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanyang_marche/models/users.dart';
import 'package:nanyang_marche/models/products.dart';
import 'package:nanyang_marche/backend/database.dart';



class ItemsWidget extends StatelessWidget{

  Products products = Products(imgURL: "imgURL", pro_desc: "pro_desc",
      pro_name: "pro_name", pro_price: "pro_price", product_id: "product_id");
  int? size;
  List imgURL_list = [];


  Future populateItems() async {
    final String? usr_id = FirebaseAuth.instance.currentUser?.uid.toString();
    final user_id_doc = FirebaseFirestore.instance.collection("users").doc(usr_id);
    final storageRef = FirebaseStorage.instance.ref();
    //final pathReference = storageRef.child("images/stars.jpg");
    String url = "assets/images/"+usr_id!+"/";
    user_id_doc.collection("products").get().then((res) {
      res.docs.forEach((element) async {
        final data = await storageRef.child(url+element.id.toString()).getDownloadURL();
        try {
          imgURL_list.add(data);
        } on FirebaseException catch (e) {
          // Handle any errors.
        }
      });


    },

      onError: (e) => print("Error completing: $e"),
    );

  }

  @override
  Widget build(BuildContext context){
    populateItems();
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i=0; i<imgURL_list.length!; i++)
          Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.more_horiz,
                    color: Color(0xFF072E54),
                  ) ,
                ],
              ),
              InkWell(
                onTap:(){} ,
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
                  "Product Title",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF072E54),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Write description of product",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF072E54),
                  ),
                ),
              ),
              Padding(
                  padding:EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$55",
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

  }
}