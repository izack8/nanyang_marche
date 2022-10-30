import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nanyang_marche/pages/marketPage2.dart';
import 'package:nanyang_marche/pages/ProfilePage.dart';
import 'package:nanyang_marche/pages/chatDetails.dart';
import 'package:nanyang_marche/pages/chatDetails2.dart';
import 'package:nanyang_marche/pages/marketPage.dart';
import 'ChatPage.dart';
import 'uploadPage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int currentInd = 0;
  final screens = [MarketPage(), UploadPage(), ChatDetailPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.withOpacity(0.3),
        title: Container(
          padding: EdgeInsets.all(25),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Text(
                  "Nanyang Marche",
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
                  Navigator.pushNamed(context,"logoutPage");
                },
                child: Icon(
                  Icons.logout_outlined,
                  size: 32,
                  color: Color(0xFF072E54),
                ),
              ),

            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: screens[currentInd],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: (index) => setState(() => currentInd = index),
          height: 60,
          color: Colors.orangeAccent.withOpacity(0.3),
          items:[
            Icon(
              Icons.home,
              size: 30,
              color: Color(0xFF072E54),
            ),
            Icon(
              Icons.chat,
              size: 30,
              color: Color(0xFF072E54),
            ),
            Icon(
              Icons.upload,
              size: 30,
              color: Color(0xFF072E54),
            ),
            Icon(
              Icons.account_box,
              size: 30,
              color: Color(0xFF072E54),
            ),
          ]
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentInd,
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.grey.shade600,
      //   selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      //   unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (index) => setState(() => currentInd = index),
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Marche",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.upload),
      //       label: "Upload",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.message),
      //       label: "Chats",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_box),
      //       label: "Profile",
      //     ),
      //   ],
      // ),
    );
  }

}