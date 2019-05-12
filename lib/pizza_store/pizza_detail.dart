import 'package:flutter/material.dart';
import 'dart:ui';
import 'pizza.dart';
import 'package:flutter_ui/utils.dart';

class PizzaDetails extends StatelessWidget {
  final Pizza pizza;

  PizzaDetails(this.pizza);

  @override
  Widget build(BuildContext context) {
    print(pizza.image);
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  top: -100,
                  right: -100,
                  child: BackgroundArc(pizza.background),
                ),
                ForegroundContent(pizza: pizza),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ForegroundContent extends StatelessWidget {
  const ForegroundContent({@required this.pizza});

  final Pizza pizza;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // child: IconButton(icon: Icon(icon:Icons.arrow_back, size: 30), color: Colors.black,),
          ),
        ),
        PizzaImage(pizza.image),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.only(left: 105, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(pizza.name),
              SizedBox(height: 20),
              StarRating(pizza.starRating),
              SizedBox(height: 20),
              Description(pizza.desc),
              SizedBox(height: 20),
              Price(pizza.price),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Price extends StatelessWidget {
  final double price;

  const Price(this.price);

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$$price",
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.w700),
    );
  }
}

class Description extends StatelessWidget {
  final String desc;

  const Description(this.desc);

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      softWrap: true,
      style: TextStyle(
        color: Colors.black87,
        letterSpacing: 1.3,
        fontSize: 17,
        textBaseline: TextBaseline.alphabetic,
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;

  const StarRating(this.rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(rating.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow[600],
          size: 25,
        )
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText(this.pizzaName);

  final String pizzaName;
  final double _fontSize = 40;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: pizzaName,
            style: TextStyle(
                color: Colors.black,
                fontSize: _fontSize,
                fontFamily: "slabo",
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: " Pizza",
            style: TextStyle(
                color: Colors.black,
                fontSize: _fontSize,
                fontFamily: "slabo",
                fontWeight: FontWeight.w600))
      ]),
    );
  }
}

class PizzaImage extends StatelessWidget {
  final String imageURI;

  const PizzaImage(this.imageURI);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Hero(
        tag: imageURI,
        child: Image.asset(imageURI),
      ),
    );
  }
}

class BackgroundArc extends StatelessWidget {
  final Color background;

  BackgroundArc(this.background);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenAwareSize(300, context),
      width: screenAwareSize(300, context),

      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(300),
      ),
    );
  }
}
