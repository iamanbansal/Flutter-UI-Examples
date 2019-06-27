import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'product_details.dart';

class ShoesShop extends StatelessWidget {
  // This widget is the root of your application.
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
  int _currentIndex = 0;

  List<Widget> bottomNavIconList = [
    Image.asset(
      "assets/shoesShop/store.png",
      width: 35.0,
      height: 35.0,
    ),
    Icon(
      CustomIcons.search,
      color: Colors.white,
      size: 32.0,
    ),
    Icon(
      CustomIcons.favorite,
      color: Colors.white,
      size: 32.0,
    ),
    Icon(CustomIcons.cart, color: Colors.white, size: 32.0),
    Image.asset("assets/shoesShop/profile.png", width: 35.0, height: 35.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292C36),
      body: Padding(
        padding: EdgeInsets.only(right: 10.0, left: 10.0,top: 15.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: Image.asset(
                  "assets/shoesShop/logo.png",
                  width: 50.0,
                  height: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, position) {
                  return Product(shoeList[position]);
                },
                itemCount: shoeList.length,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(color: Color(0xFF292C36), boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.065),
                offset: Offset(0.0, -3.0),
                blurRadius: 10.0)
          ]),
          child: Row(
            children: bottomNavIconList.map((item) {
              var index = bottomNavIconList.indexOf(item);
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: bottomNavItem(item, index == _currentIndex),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

bottomNavItem(Widget item, bool isSelected) => Container(
      decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.02),
                      offset: Offset(0.0, 5.0),
                      blurRadius: 10.0)
                ]
              : []),
      child: item,
    );

class Product extends StatelessWidget {
  Shoe shoe;

  Product(this.shoe);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetails(shoe)),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15.0),
        decoration: BoxDecoration(
            color: Color(shoe.cardColor),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            Hero(
              tag: shoe.title,
              child: Image.asset(
                shoe.imgUrl,
                width: 281.0,
                height: 191.0,
              ),
            ),
            Text(
              shoe.title,
              style: TextStyle(fontSize: 25.0, fontFamily: "Raleway"),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(CustomIcons.favorite),
                  onPressed: () {},
                ),
                Column(
                  children: <Widget>[
                    Text(
                      shoe.previousPrice,
                      style: TextStyle(
                          color: Color(0xFFfeb0ba),
                          fontSize: 16.0,
                          fontFamily: "Helvetica"),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      shoe.price,
                      style: TextStyle(fontSize: 28.0, fontFamily: "Helvetica"),
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(CustomIcons.cart),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Shoe {
  int cardColor;
  String imgUrl;
  String title;
  String previousPrice;
  String price;

  Shoe(this.cardColor, this.imgUrl, this.title, this.previousPrice, this.price);
}

List<Shoe> shoeList = [
  Shoe(0xFFfaecfb, "assets/shoesShop/shoes_01.png", "Hybrid Rocket WWS",
      "\$333", "\$444"),
  Shoe(0xFFf8e1da, "assets/shoesShop/shoes_02.png", "Hybrid Runner ARS",
      "\$699", "\$599")
];
