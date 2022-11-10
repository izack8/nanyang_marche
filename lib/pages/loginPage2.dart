import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nanyang_marche/backend/authentication.dart';
import 'package:nanyang_marche/pages/SignUpPage.dart';
import 'package:get/get.dart';
import 'package:nanyang_marche/pages/homePage.dart';
import 'package:nanyang_marche/pages/marketPage.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  get okButton => null;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),

            fit: BoxFit.cover,
          )
      ),
      child: Scaffold(
        //resizeToAvoidBottomInset:false,
        backgroundColor: Colors.white.withOpacity(0.7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h*0.08,),
              Container(
                width: w* 0.5,
                height: h * 0.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/marche.png",
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height:h*0.03,),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Welcome",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const Text("Login in to your account",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2)
                            )
                          ]
                      ),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: const Icon(
                                Icons.email, color: Colors.deepOrangeAccent),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color:Colors.white,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color:Colors.white,
                                    width: 1.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: const Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2)
                            )
                          ]
                      ),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: const Icon(
                                Icons.password_outlined, color: Colors.deepOrangeAccent),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color:Colors.white,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color:Colors.white,
                                    width: 1.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            )
                        ),
                      ),
                    ),
                    SizedBox(height: h*0.035,),
                    Row(
                      children: [
                        Expanded(child: Container(),),
                        const Text("Forget your Password?",
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
              SizedBox(height:h*0.05,),
              GestureDetector(
                onTap: signInUser,
                child: Container(
                  width: w*0.5,
                  height: h*0.08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xff18a0fb), width: 1,),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Log in",
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
                ),),
              SizedBox(height:h*0.04,),
              GestureDetector(
                onTap: registerUser ,
                child: RichText(text: const TextSpan(
                    text: "Don\'t have an account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20
                    ),
                    children: [
                      TextSpan(
                        text: " Create",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),

                      )
                    ]
                )),
              ),

            ],
          ),
        ),
      ),
    );

  }

  void registerUser() async {
    Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => const SignUpPage(),
      ),
    );
  }
  //sign in user funtion, leads to HomePage()
  void signInUser() async {

    dynamic authResult = await _auth.loginUser(_emailController.text, _passwordController.text);
    if (authResult == null) {
      showAlertDialog(context);
    } else {
      _emailController.clear();
      _passwordController.clear();
      Navigator.of(context).push(
        CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (context) => const HomePage(),
        ),
      );
   // }
    }
  }


}

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog')
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Wrong Credentials"),
    content: const Text("Please try again"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

