import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/pizza_store/pizza_detail.dart';
import 'package:flutter_ui/utils.dart';

import 'pizza.dart';

// void main() => runApp(PizzaStore());

class PizzaStore extends StatelessWidget {
  static const routeName = 'pizza_store';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PizzaHome();
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

class PizzaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Color(0xff000000));
    return Scaffold(
      body: MainApp(),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                titleBar(),
                tabs(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget titleBar() {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              "Featured",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
            ),
            Text("Food", style: TextStyle(fontSize: 50))
          ],
        )
      ],
    ),
  );
}

Widget tabs() {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Container(
      height: 580,
      width: double.infinity,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                color: Colors.transparent,
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        isScrollable: true,
                        labelPadding: EdgeInsets.only(top: 15),
                        indicatorColor: Colors.black,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            fontFamily: "slabo"),
                        unselectedLabelColor: Colors.black26,
                        unselectedLabelStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                            fontFamily: "slabo"),
                        tabs: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 60),
                            child: Text(
                              "Pizza",
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 60),
                            child: Text("Rolls"),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 60),
                            child: Text("Burgers"),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 60),
                            child: Text("Sandwiches"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              pizzaShowCase(),
              Center(
                child: Text(
                  "Rolls Tab",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Center(
                child: Text(
                  "Burgers Tab",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Center(
                child: Text(
                  "Sandwiches Tab",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget pizzaShowCase() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 30),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: pizzaList.pizzas.length,
      itemBuilder: (BuildContext context, int i) {
        return ListOfPizzas(
          name: pizzaList.pizzas[i].name,
          image: pizzaList.pizzas[i].image,
          price: pizzaList.pizzas[i].price,
          background: pizzaList.pizzas[i].background,
          foreground: pizzaList.pizzas[i].foreground,
          pizza: pizzaList.pizzas[i],
        );
      },
    ),
  );
}

class ListOfPizzas extends StatelessWidget {
  const ListOfPizzas(
      {@required this.foreground,
      @required this.background,
      @required this.price,
      @required this.name,
      @required this.image,
      @required this.pizza});

  final Color foreground;
  final Color background;
  final double price;
  final String name;
  final String image;
  final Pizza pizza;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print(pizza.image);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PizzaDetails(pizza)));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 35, horizontal: 20),
            width: 225,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    height: 180,
                    child: Hero(
                      tag: image,
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                      style: TextStyle(
                          color: foreground, fontSize: 25, fontFamily: "slabo"),
                      children: [
                        TextSpan(text: name),
                        TextSpan(
                            text: "\nPizza",
                            style: TextStyle(fontWeight: FontWeight.w800))
                      ]),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("\$$price",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: foreground,
                              fontFamily: "arial")),
                    ),
                    StatefulFavIcon(
                      foreground: foreground,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 40,
        )
      ],
    );
  }
}

class StatefulFavIcon extends StatefulWidget {
  const StatefulFavIcon({@required this.foreground});

  final Color foreground;

  @override
  _StatefulFavIconState createState() => _StatefulFavIconState();
}

class _StatefulFavIconState extends State<StatefulFavIcon> {
  bool isFav;

  @override
  void initState() {
    super.initState();
    isFav = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFav = !isFav;
        });
      },
      child: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: widget.foreground,
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final double _size = 30;
  final double _padding = 5;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: screenAwareSize(_size, context),
              width: screenAwareSize(_size, context),
              padding: EdgeInsets.all(_padding),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                    "https://avatars1.githubusercontent.com/u/24875315?s=400&v=4",
                    fit: BoxFit.contain),
              ),
            ),
            Container(
              height: screenAwareSize(_size, context),
              width: screenAwareSize(_size, context),
              padding: EdgeInsets.all(_padding),
              child: Icon(
                Icons.store,
                size: screenAwareSize(_size, context),
              ),
            ),
            Container(
              height: screenAwareSize(_size, context),
              width: screenAwareSize(_size, context),
              padding: EdgeInsets.all(_padding),
              child: Icon(
                Icons.search,
                size: screenAwareSize(_size, context),
              ),
            ),
            Container(
              height: screenAwareSize(_size, context),
              width: screenAwareSize(_size, context),
              padding: EdgeInsets.all(_padding),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.card_travel,
                color: Colors.white,
                size: screenAwareSize(_size * 0.5, context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
