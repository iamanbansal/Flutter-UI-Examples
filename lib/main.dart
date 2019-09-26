import 'package:flutter/material.dart';
import 'package:flutter_ui/rent_car/main.dart';
import 'ShoesShop/main.dart';
import 'ListItem.dart';
import 'everlance/main.dart';
import 'flutter_stroy/main.dart';
import 'pizza_store/main.dart';
import 'greenary/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'UI List'),
        routes: {
          FlutterStory.routeName: (context) => FlutterStory(),
          ShoesShop.routeName: (context) => ShoesShop(),
          PizzaStore.routeName: (context) => PizzaStore(),
          GreeneryApp.routeName: (context) => GreeneryApp(),
          RentCar.routeName: (context) => RentCar(),
          EverLance.routeName: (context) => EverLance(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (context, position) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, uiList[position].route);
            },
            child: Card(
                margin: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(uiList[position].name),
                )),
          );
        },
        itemCount: uiList.length,
      )),
    );
  }
}
