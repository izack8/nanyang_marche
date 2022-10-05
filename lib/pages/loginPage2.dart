import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanyang_marche/backend/authentication.dart';
import 'package:nanyang_marche/pages/homePage.dart';
import 'registrationPage.dart';
import 'package:firebase_core/firebase_core.dart';



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
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty';
                          } else
                            return null;
                        },
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white)),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be empty';
                          } else
                            return null;
                        },
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white)),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      TextButton(
                        child: const Text('Not registerd? Sign up'),
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => const RegistrationScreen(),
                            ),
                          );
                        },
                        //textColor: Colors.white,
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: const Text('Login'),
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                signInUser();
                              }
                            },
                            //color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


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
    child: Text("OK"),
    onPressed: () {
      return;
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Wrong Credentials"),
    content: Text("Please try again"),
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