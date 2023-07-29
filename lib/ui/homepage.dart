import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signalator/ui/profilepage/profilepage.dart';
import 'package:signalator/widget/card_translator%20copy.dart';
import 'package:signalator/widget/card_translator.dart';
import 'package:signalator/widget/card_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background.png', // Replace with your background image asset path
                fit: BoxFit.fitWidth,
              ),
            ),
            AppBar(
              title: const Text("Sign Language App"),
              backgroundColor:
                  Colors.transparent, // Make the AppBar transparent
              elevation: 0, // Remove the shadow of the AppBar
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: cardTranslatorother(
                name: "Sign Languange Translator",
                detail: "Pick From Image",
                pictureUrl:
                    "https://images.unsplash.com/photo-1502159212845-f31a19546a5d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
