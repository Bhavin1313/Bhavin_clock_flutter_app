import 'dart:math';

import 'package:flutter/material.dart';

class StrapWatch extends StatefulWidget {
  const StrapWatch({super.key});

  @override
  State<StrapWatch> createState() => _StrapWatchState();
}

class _StrapWatchState extends State<StrapWatch> {
  @override
  int h = 0;
  int m = 0;
  int s = 0;

  MyWatch() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        h = DateTime.now().hour % 12;
        m = DateTime.now().minute;
        s = DateTime.now().second;
      });
      MyWatch();
    });
  }

  @override
  void initState() {
    super.initState();
    MyWatch();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Clock App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://img.jagranjosh.com/webstories/42387/world-water-day-1679466339.jpeg"),
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
                  "Strap Watch",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ...List.generate(
                    24,
                    (index) => Transform.rotate(
                      angle: (pi * 2) * (index / 24),
                      child: Divider(
                        color: Color(0xff0016FF),
                        indent: MediaQuery.of(context).size.width * .50,
                        endIndent: MediaQuery.of(context).size.width * .35,
                        thickness: 3,
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: 8,
                    child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                      strokeWidth: 4,
                      value: s.toDouble() / 60,
                    ),
                  ),
                  Transform.scale(
                    scale: 6,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 5,
                      value: m.toDouble() / 60,
                    ),
                  ),
                  Transform.scale(
                    scale: 4,
                    child: CircularProgressIndicator(
                      color: Colors.green,
                      strokeWidth: 8,
                      value: h.toDouble() / 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
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
                    Navigator.of(context).pushNamed('/');
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
                        "Analog Clock",
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
