import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // DateTime h = DateTime.now();
  int h = 0;
  int s = 0;
  int m = 0;

  myClock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        h = DateTime.now().hour;
        s = DateTime.now().second;
        m = DateTime.now().minute;
      });
      myClock();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myClock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text("Clock App"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.freeimages.com/365/images/previews/c3b/water-theme-vector-8594.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(25),
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Color(0xff0016FF),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  "Analog clock",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff00A5FF),
                    ),
                  ),
                  Container(
                    height: 322,
                    width: 322,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://4vector.com/i/free-vector-water-theme-vector_003482_water2.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ...List.generate(
                    60,
                    (index) => Transform.rotate(
                      angle: (pi * 2) * (index / 60),
                      child: Divider(
                        endIndent: MediaQuery.of(context).size.width * .95,
                        color: (index % 5 == 0) ? Colors.red : Colors.grey,
                        thickness: (index % 5 == 0) ? 7 : 4,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: (pi * 2) * (s / 60),
                      child: Divider(
                        color: Color(0xff00A5FF),
                        thickness: 2,
                        endIndent: MediaQuery.of(context).size.width * .5,
                        indent: MediaQuery.of(context).size.width * .10,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: (pi * 2) * (m / 60),
                      child: Divider(
                        color: Color(0xff00A5FF),
                        thickness: 4,
                        endIndent: MediaQuery.of(context).size.width * .5,
                        indent: MediaQuery.of(context).size.width * .15,
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: (pi * 2) * (h / 12),
                      child: Divider(
                        color: Color(0xff00A5FF),
                        thickness: 7,
                        endIndent: MediaQuery.of(context).size.width * .5,
                        indent: MediaQuery.of(context).size.width * .20,
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('digital');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 60, left: 10),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xff0016FF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Digital clock",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('strap_watch');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 60, right: 10),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xff0016FF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Strap Watch",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
