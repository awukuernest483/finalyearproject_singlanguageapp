import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signalator/authentication/loginscreen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tflite/tflite.dart';
import '../../utils/colors.dart';
import '../../utils/sizes.dart';
import '../widget/card_widget.dart';

class Intropage extends StatefulWidget {
  @override
  _IntropageState createState() => _IntropageState();
}

String? res;

//ignore

class _IntropageState extends State<Intropage> {
  @override
  void initState() {
    //loadModel();
    super.initState();
  }

  bool panelOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: secondaryColor,
        systemNavigationBarColor: whiteColor,
      ),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: SlidingUpPanel(
              onPanelOpened: () {
                setState(() {
                  panelOpen = true;
                });
              },
              onPanelClosed: () {
                setState(() {
                  panelOpen = false;
                });
              },
              margin: const EdgeInsets.only(bottom: 0),
              minHeight: displayHeight(context) * 0.6,
              maxHeight: displayHeight(context) * 1,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
              ),
              panel: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                  ),
                  color: whiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: displayWidth(context) * 0.12,
                            height: 3,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 20),
                            child: Row(
                              children: [
                                const Text(
                                  'Resources',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset('assets/svgs/scrolldown.svg'),
                                const Text(
                                  'Scroll down for more ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          physics: (panelOpen)
                              ? const BouncingScrollPhysics()
                              : const NeverScrollableScrollPhysics(),
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 10),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10,
                                        top: 5,
                                        bottom: 5),
                                    decoration: BoxDecoration(
                                      color:
                                          mainColor, // Set the desired background color here
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Text(
                                      'Dictionary',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/A.png',
                                            width: displayWidth(context) * 0.2,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'A',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/B.png',
                                            width:
                                                displayWidth(context) * 0.116,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'B',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/C.png',
                                            width: displayWidth(context) * 0.2,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'C',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/D.png',
                                            width: displayWidth(context) * 0.12,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'D',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/E.png',
                                            width: displayWidth(context) * 0.13,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'E',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/F.png',
                                            width:
                                                displayWidth(context) * 0.128,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'F',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/G.png',
                                            width: displayWidth(context) * 0.25,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'G',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/H.png',
                                            width: displayWidth(context) * 0.25,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'H',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/I.png',
                                            width:
                                                displayWidth(context) * 0.128,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'I',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/J.png',
                                            width: displayWidth(context) * 0.2,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'J',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/K.png',
                                            width: displayWidth(context) * 0.12,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'K',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/L.png',
                                            width: displayWidth(context) * 0.15,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'L',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/M.png',
                                            width: displayWidth(context) * 0.19,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'M',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/N.png',
                                            width: displayWidth(context) * 0.19,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'N',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/O.png',
                                            width: displayWidth(context) * 0.16,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'O',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/P.png',
                                            width: displayWidth(context) * 0.25,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'P',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/Q.png',
                                            width: displayWidth(context) * 0.19,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Q',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/R.png',
                                            width: displayWidth(context) * 0.1,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'R',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/S.png',
                                            width: displayWidth(context) * 0.19,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'S',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/T.png',
                                            width: displayWidth(context) * 0.19,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'T',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/U.png',
                                            width: displayWidth(context) * 0.13,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'U',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/V.png',
                                            width: displayWidth(context) * 0.15,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'V',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/W.png',
                                            width: displayWidth(context) * 0.15,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'W',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/X.png',
                                            width: displayWidth(context) * 0.14,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'X',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/Y.png',
                                            width: displayWidth(context) * 0.2,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Y',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: displayWidth(context) * 0.4,
                                  width: displayWidth(context) * 0.3,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/signs/Z.png',
                                            width: displayWidth(context) * 0.13,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Z',
                                            style: TextStyle(
                                              fontFamily: 'Comfortaa',
                                              fontWeight: FontWeight.w600,
                                              fontSize:
                                                  displayWidth(context) * 0.12,
                                              color: mainColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 10),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10,
                                        top: 5,
                                        bottom: 5),
                                    decoration: BoxDecoration(
                                      color:
                                          mainColor, // Set the desired background color here
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Text(
                                      'Speech to text',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const cardWidget(
                              name: "Speech To Text",
                              pictureUrl:
                                  "https://images.unsplash.com/photo-1559223607-180d0c16c333?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80",
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, bottom: 10),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10,
                                        top: 5,
                                        bottom: 5),
                                    decoration: BoxDecoration(
                                      color:
                                          mainColor, // Set the desired background color here
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: const Text(
                                      'Text to Speech',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const cardWidget(
                              name: "Text To Speech",
                              pictureUrl:
                                  "https://images.unsplash.com/photo-1580130037321-446dba3cacc2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=726&q=80",
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Communication should have no barriers',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: displayWidth(context) * 0.7,
                          child: const Text(
                            'While you\'re here, you can learn some sign language or proceed with live translation.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Hero(
                          tag: 'button',
                          child: Container(
                            width: displayWidth(context) * 0.7,
                            height: displayWidth(context) * 0.14,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 10),
                                  spreadRadius: -5,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                // splashColor: mainColor,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    SlideRightRoute(page: const LoginScreen()),
                                  );
                                },
                                child: const Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Proceed to Live Translation',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // color: mainColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Hero(
                          tag: 'back',
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: displayWidth(context) * 0.07,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}


/*
SafeArea(
          child: Stack(
            children: [
              Container(
                color: whiteColor,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'A2E',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w600,
                              fontSize: displayWidth(context) * 0.1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: displayWidth(context) * 0.5,
                            child: Text(
                              'Communication should have no boundaries',
                              style: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontWeight: FontWeight.w800,
                                fontSize: displayWidth(context) * 0.04,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.transparent,
                  height: displayWidth(context) * 1.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(90),
                            ),
                          ),
                          height: 800,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),*/
