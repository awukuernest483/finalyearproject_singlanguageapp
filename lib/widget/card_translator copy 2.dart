import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:signalator/ui/signlanguagedictionary/dictionarypage.dart';
import 'package:signalator/ui/signlanguagedictionary/historysignlanguage.dart';
import 'package:signalator/ui/signlanguagetranslator/historysigntranslator.dart';
import 'package:signalator/ui/signlanguagetranslator/signcamerapage.dart';
import 'package:signalator/ui/signlanguagetranslator/signpickerpage.dart';
import 'package:signalator/ui/signlanguagedictionary/signtranslate.dart';

class cardTranslatorother2 extends StatelessWidget {
  final String name;
  final String pictureUrl;
  final String detail;

  const cardTranslatorother2(
      {Key? key,
      required this.name,
      required this.pictureUrl,
      required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Ink.image(
                image: NetworkImage(pictureUrl),
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.modulate),
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
                child: InkWell(),
              ),
              const Column(
                children: [
                  Icon(
                    Icons.photo_library_outlined,
                    size: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tap here to to pick image from Gallery',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CameraScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            50), // Adjust the radius as needed
                        color: Colors.grey[200], // Change the color as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.translate,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              detail,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const signLanguageHistoryPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            50), // Adjust the radius as needed
                        color: Colors.grey[200], // Change the color as needed
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 10.0, right: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              color: Colors.black,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "See History",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
