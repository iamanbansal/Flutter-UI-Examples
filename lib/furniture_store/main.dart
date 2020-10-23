import 'package:flutter/material.dart';
import 'package:flutter_ui/furniture_store/home.dart';

class FurnitureStore extends StatelessWidget {
  static const routeName = 'furniture_store';
  static const assetPath = 'assets/find_rooms/';
  static const themeColorGreen = Color(0xFF01b075);

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              FurnitureStore.assetPath + "roomie_home_icon.png",
              height: 90,
              width: 90,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Book Your",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Awesom Room",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "Roomie is the Best Solution to find room to stay and enjoy holiday",
                style: TextStyle(fontSize: 20, height: 2),
                textAlign: TextAlign.center),
            SizedBox(
              height: 50,
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomieHome()),
                );
              },
              color: FurnitureStore.themeColorGreen,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Explore Room",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
