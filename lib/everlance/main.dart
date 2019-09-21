import 'package:flutter/material.dart';
import 'package:flutter_ui/utils.dart';

var violet = Color(0xFF211732);
var violet4 = Color(0xFF211732);
var violet2 = Color(0xFF322242);
var violet3 = Color(0xFF7e57c2);
var grey = Color(0xFFDCD8E7);

class EverLance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: violet,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
        title: Text("EVERLANCE"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: screenAwareSize(250, context),
                      width: screenAwareSize(250, context),
                      decoration: BoxDecoration(
                        color: violet2,
                        borderRadius: BorderRadius.circular(250),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    child: Image.asset("assets/everlance/model2.png"),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    FloatingActionButton(
                          child: Icon(null),
                          onPressed: () {},
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                          heroTag: "b1",
                        ),
                      ovalButton(),
                      fab(
                          icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 10,
                      ),
                      color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Image.asset("assets/everlance/model1.png"),
                    ),
                  ),
                  Container(
                    color: violet.withAlpha(200),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AW 2019",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 50,
                              color: Colors.white),
                        ),
                        Text("LOOKBOOK", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    left: 0,
                    child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                              FloatingActionButton(
                          child: Icon(Icons.arrow_drop_down,color: Colors.black,),
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          heroTag: "b2",
                        ),
                            ovalButton(),
                            fab(
                                icon: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 10,
                            ), color: violet2)
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container fab({Icon icon, Color color}) {
    return Container(
      height: 20,
      width: 20,
      child: FloatingActionButton(
        child: icon,
        onPressed: () {},
        backgroundColor: color,
        heroTag: icon,
      ),
    );
  }

  ButtonTheme ovalButton() {
    return ButtonTheme(
      minWidth: 40,
      height: 20,
      child: RaisedButton(
        color: violet3,
        child: Icon(
          Icons.chevron_right,
          color: Colors.white,
        ),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
