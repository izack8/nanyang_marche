import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../backend/authentication.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key?key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
  }

class _SignUpPageState extends State<SignUpPage> {

  final AuthenticationService _auth = AuthenticationService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white.withOpacity(0.7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h*0.08,),
              Container(
                width: w*0.5,
                height: h * 0.2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/marche.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: h*0.02,),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sign up now!",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("Create your account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: h*0.03,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2)
                            )
                          ]
                      ),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            hintText: "Name",
                            prefixIcon: Icon(
                                Icons.manage_accounts, color: Colors.deepOrangeAccent),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: h* 0.02,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2)
                            )
                          ]
                      ),
                      child: TextField(
                        controller: _emailContoller,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(
                                Icons.email, color: Colors.deepOrangeAccent),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: h* 0.02,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2)
                            )
                          ]
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password_outlined,
                                color: Colors.deepOrangeAccent),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.035,),
                    Row(
                      children: [
                        Expanded(child: Container(),),
                        Text("Forget your Password?",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueAccent,
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
              SizedBox(height: h*0.04,),
              GestureDetector(
                child: Container(
                  width: w * 0.5,
                  height: h * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff18a0fb), width: 1,),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff18a0fb),
                          fontSize: 25,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ), onTap: createUser,
              ),
              SizedBox(height: h*0.03,),
              GestureDetector(
                child:RichText(text: TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),
                    children: [
                      TextSpan(
                        text: " Log in",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                )
                ), onTap: popContext,
              ),
            ],
          ),
        ),
      ),
    );

  }

  void popContext() async {
    Navigator.pop(context);
  }

  void createUser() async {
    dynamic result = await _auth.createNewUser(
        _nameController.text, _emailContoller.text, _passwordController.text);
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
      _nameController.clear();
      _passwordController.clear();
      _emailContoller.clear();
      Navigator.pop(context);
    }
  }
}