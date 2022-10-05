import 'package:flutter/material.dart';
import '../backend/authentication.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Register',
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
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be empty';
                          } else
                            return null;
                        },
                        decoration: const InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _emailContoller,
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
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white)),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            child: const Text('Sign Up'),
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                createUser();
                              }
                            }
                          ),
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            }
                          )
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