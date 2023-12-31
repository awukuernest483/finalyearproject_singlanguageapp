import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signalator/authentication/registerscreen.dart';
import 'package:signalator/ui/homepage.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1), () {
      if (currentUser!.email!.isNotEmpty) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const MyHomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 50),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/img/signalator.png",
                  height: 80,
                  width: 80,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: const Text(
                  "Sign lang",
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.black, // Change this color to your desired color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text("Login"),
                  onPressed: () async {
                    if (_emailController.text.isNotEmpty) {
                      if (_passwordController.text.isNotEmpty) {
                        if (_passwordController.text.length < 8) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("False Password"),
                              content: const Text(
                                  "Please input your password more than 8 characters!"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text("Ok"),
                                  onPressed: () {
                                    Navigator.of(context).pop("Ok");
                                  },
                                ),
                              ],
                            ),
                          );
                        } else {
                          try {
                            await _firebaseAuth
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then(
                                  (value) =>
                                      Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const MyHomePage(),
                                    ),
                                  ),
                                );
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Login Problem"),
                                content: const Text(
                                    "Please input your email and password correctly!"),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text("Ok"),
                                    onPressed: () {
                                      Navigator.of(context).pop("Ok");
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Blank Password"),
                            content: const Text("Please input your password!"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop("Ok");
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Blank Email"),
                          content: const Text("Please input your email!"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("Ok"),
                              onPressed: () {
                                Navigator.of(context).pop("Ok");
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_emailController.text.isNotEmpty) {
                    await _firebaseAuth.sendPasswordResetEmail(
                        email: _emailController.text);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          "Forgot Password",
                        ),
                        content: Text(
                            "Reset password already sent to Email: ${_emailController.text}"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop("Ok");
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Forgot Password"),
                        content: const Text(
                            "Please input your email to reset password"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop("Ok");
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "\t\t Don't have an account?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.black, // Change this color to your desired color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text("Sign Up"),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.white,
  primary: Colors.blue[900],
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(6)),
  ),
);
