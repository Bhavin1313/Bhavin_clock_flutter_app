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
        centerTitle: true,
        title: Text("Analog App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.punch_clock_outlined),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountEmail: Text(
                "Bhavin1313bhalaal@gmail.com",
              ),
              accountName: Text(
                "Bhavin Bhalala",
              ),
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                  "https://a1cf74336522e87f135f-2f21ace9a6cf0052456644b80fa06d4f.ssl.cf2.rackcdn.com/images/characters/large/800/The-Hulk.The-Incredible-Hulk.webp",
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.ballot_rounded),
                SizedBox(
                  width: 10,
                ),
                Text("Manage Apps And device"),
              ],
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.doorbell),
                SizedBox(
                  width: 10,
                ),
                Text("Notification and offers"),
              ],
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.wallet),
                SizedBox(
                  width: 10,
                ),
                Text("Payments and subscripstion"),
              ],
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.play_circle),
                SizedBox(
                  width: 10,
                ),
                Text("Play Protect"),
              ],
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.local_library),
                SizedBox(
                  width: 10,
                ),
                Text("Library"),
              ],
            ),
            Divider(),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.settings),
                SizedBox(
                  width: 10,
                ),
                Text("Settings"),
              ],
            ),
            Divider(),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.pexels.com/photos/719396/pexels-photo-719396.jpeg?cs=srgb&dl=pexels-gabriel-peter-719396.jpg&fm=jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueAccent,
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
                        "https://img.freepik.com/free-photo/3d-abstract-space-background-with-wireframe-landscape_1048-10648.jpg?w=996&t=st=1688551810~exp=1688552410~hmac=ada1a68f6cae24dc7a77aec3ac81e6eb4e89904d92032946489c1f769a019fd8"),
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
                    color: Colors.black,
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
                    color: Colors.black,
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
                    color: Colors.black,
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
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
