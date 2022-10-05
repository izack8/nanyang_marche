import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ChatPage.dart';
import 'uploadPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int currentInd = 0;
  final screens = [ChatPage(), UploadPage(), ChatPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentInd],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentInd,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => currentInd = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: "Upload",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
      ),
    );
  }

}