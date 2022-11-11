import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nanyang_marche/models/users.dart';
import 'package:nanyang_marche/models/products.dart';
import 'package:nanyang_marche/backend/database.dart';



class ProductPage extends StatefulWidget {
  const ProductPage({Key?key}) : super(key: key);

  static var imgURL;
  static var p_name;
  static var p_desc;
  static var p_price;
  static var user_name;

  @override
  // ignore: library_private_types_in_public_api
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff6f1e4),
      body: SizedBox(
        width: width,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            SizedBox(height: height*0.02,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    hero(),
                    SizedBox(height: height*0.02,),
                    Text(ProductPage.p_name.toString(),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.monetization_on_outlined),
                        Text(ProductPage.p_price.toString(),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_box),
                        Text("Isaac ",
                          style: TextStyle(fontSize: 15, ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.01,),

                    Text(ProductPage.p_desc.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(height: 1.75)
                    ),
                    SizedBox(height: height*0.05,),

                  ],
                ),
              ),
            ),
            Center(child: ChatBar()
            ),
            SizedBox(height: height*0.02,),
          ],),
      ),
    );
  }



  Widget header() {
    return Container(
      color: Colors.orangeAccent.withOpacity(0.3),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Text(
              "Product Info",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF072E54),
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: (){
              Navigator.pop(context);

            },
            child: Icon(
              Icons.close,
              size: 32,
              color: Color(0xFF072E54),
            ),
          ),
        ],
      ),
    );
  }
}

Widget hero(){
  return Container(
    child: Stack(
      children: [
        Image.network(ProductPage.imgURL,height:370 , width: 600),
      ],
    ),
  );
}


Widget ChatBar(){
  return Material(
      color: Color.fromRGBO(24, 160, 251, 1),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
          onTap:() {
            print('Click');
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(20)
              ),

              child: Text("Chat", textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Montserrat',
                  fontSize: 22,
                ),
              )
          )
      )
  );
}


