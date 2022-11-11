import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanyang_marche/backend/authentication.dart';
import '../widgets/HomeAppBar.dart';
import 'package:nanyang_marche/widgets/CategoriesWidget.dart';
import 'package:nanyang_marche/widgets/ItemsWidget.dart';
import 'package:firebase_core/firebase_core.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  static final TextEditingController searchController = TextEditingController();

  @override
  _MarketPageState createState() => _MarketPageState();

}

class _MarketPageState extends State<MarketPage> {



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
        children: [
          //Custom App Bar Widget
          Container(
            padding:  EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
                color: Color(0xfff6f1e4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration:BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      //Search Widget
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        height: 50,
                        width: 300,
                        child: TextFormField(
                          controller: MarketPage.searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search here...",
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (() => {
                          setState(() {})
                        }),
                        child: Icon(
                          Icons.search,
                          size: 27,
                          color: Color(0xFF072E54),
                        ),
                      ),
                    ],
                  ),
                ),

                //Categories
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF072E54)),
                  ),
                ),
                // Categories Widget
                CategoriesWidget(),
                //Items
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  child: Text(
                    "Recommendation",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF072E54),
                    ),
                  ),
                ),
                //ItemsWidget
                ItemsWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }


}