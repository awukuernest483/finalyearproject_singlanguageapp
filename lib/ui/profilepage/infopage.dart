import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFF000000),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: HeaderCurvedContainer(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: SingleChildScrollView(
                          child: Text(
                            "Developed by Ernest Awuku Junior and Asanzire Augustine for our final year project in Computer Science at Kwame Nkrumah University of Science and Technology, this app offers practical solutions to real-world challenges. Combining our passion for coding and problem-solving, we created an efficient application with user-friendly features, ranging from everyday task management to seamless communication.\n\nOur collaborative effort exemplifies the power of teamwork and creativity. With guidance from esteemed professors, we delivered a cutting-edge product that showcases our dedication to excellence. This experience fuels our ambition for tech careers and impactful contributions to society.",
                            style: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "About Us",
                  style: TextStyle(
                    fontSize: 25,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/noimage.png'),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFF000000);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
