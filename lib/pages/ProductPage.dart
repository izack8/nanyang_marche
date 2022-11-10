import 'package:flutter/material.dart';
import 'package:nanyang_marche/widgets/HomeAppBar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key?key}) : super(key: key);

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
                    Text("Product Title",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.monetization_on_outlined),
                        Text("Price ",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.01,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_box),
                        Text("Seller Name ",
                          style: TextStyle(fontSize: 15, ),
                        ),
                      ],
                    ),
                    SizedBox(height: height*0.01,),

                    Text("Chanel Premiere available for Sale."
                        "Used with care and flaws are barely noticeable. "
                        "This is the most difficult size to come by.  ",
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
              Navigator.pushNamed(context,"Homepage2");

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
        Image.asset("assets/images/chanel1.png",height:370 , width: 600),
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


