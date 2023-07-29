import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signalator/ui/signlanguagetranslator/signtranslate.dart';

class signLanguageHistoryPage extends StatefulWidget {
  const signLanguageHistoryPage({Key? key}) : super(key: key);

  @override
  _signLanguageHistoryPageState createState() =>
      _signLanguageHistoryPageState();
}

class _signLanguageHistoryPageState extends State<signLanguageHistoryPage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  CollectionReference signHistory =
      FirebaseFirestore.instance.collection("signTranslatorHistory");

  Future<void> _deleteHistory(String historyId) async {
    await signHistory.doc(historyId).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a history')));
  }

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
              title: const Text("Translate to Sign History"),
              backgroundColor:
                  Colors.transparent, // Make the AppBar transparent
              elevation: 0, // Remove the shadow of the AppBar
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: signHistory
            .where("email", isEqualTo: currentUser!.email)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['text']),
                    subtitle: Text(documentSnapshot['detail']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.translate),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => signTranslatorHistory(
                                        signText: documentSnapshot['text']
                                            .toString()
                                            .toLowerCase()),
                                  ),
                                );
                              }),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _deleteHistory(documentSnapshot.id);
                              }),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
