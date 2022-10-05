import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanyang_marche/models/users.dart';
import '../models/chatMessage.dart';


class ChatDetailPage extends StatefulWidget{
  const ChatDetailPage({super.key});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}


class _ChatDetailPageState extends State<ChatDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.black,),
                  ),
                  const SizedBox(width: 2,),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "<https://randomuser.me/api/portraits/men/5.jpg>"),
                    maxRadius: 20,
                  ),
                  const SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Kriss Benwat", style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 6,),
                        Text("Online", style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),),
                      ],
                    ),
                  ),
                  const Icon(Icons.settings, color: Colors.black54,),
                ],
              ),
            ),
          ),
        ),


    );
  }



  void _onThemeIconTap() {
    //   setState(() {
    //     if (isDarkTheme) {
    //       theme = LightTheme();
    //       isDarkTheme = false;
    //     } else {
    //       theme = DarkTheme();
    //       isDarkTheme = true;
    //     }
    //   });
    // }
  }
}

