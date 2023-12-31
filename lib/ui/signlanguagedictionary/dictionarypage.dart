import 'package:flutter/material.dart';

class dictionaryPage extends StatefulWidget {
  const dictionaryPage({Key? key}) : super(key: key);

  @override
  _dictionaryPageState createState() => _dictionaryPageState();
}

class _dictionaryPageState extends State<dictionaryPage> {
  String alphabet = 'abcdefghijklmnopqrstuvwxyz';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Language Dictionary'),
        backgroundColor: const Color(0xFF000000),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 6 / 7,
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
          ),
          itemCount: alphabet.length,
          itemBuilder: (BuildContext ctx, index) {
            return Card(
              child: Column(
                children: [
                  Image.asset(
                    "assets/img/sign-alphabet/s${alphabet[index]}.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    alphabet[index].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
