import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

class RealEstateDetails extends StatelessWidget {
  final String image;

  RealEstateDetails(this.image);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent));

    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: image,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image)),
                )),
          ),
            ListView(
              physics: ClampingScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 2 - 100),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25 ),
                      child: Container(
                        padding: EdgeInsets.only(top: 35),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0)),
                            color: Colors.white),
                        child: Padding(
                          padding: EdgeInsets.only(right: 20,left: 20,top: 20 ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hailey Smith",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20)),
                              Text("Buy & Sell",style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15)),
                              SizedBox(height: 10,),

                              StarRating(starCount: 5, rating:4.0,color:Colors.yellow),
                              SizedBox(height: 10,),

                              Text("Grand Villa House",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25)),
                              SizedBox(height: 10,),
                              Text("124, Street, Newyork - 1000",style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15)),
                              SizedBox(height: 25,),
                              facilities,
                              SizedBox(height: 40,),
                              priceRow
                            ],
                          ),
                        ),
                      ),
                    ),
                    profilePic
                  ],
                )
              ],
            ),

        ],
      ),
    );
  }
}

var profilePic  =  Positioned(
  left: 25,
  child: Container(
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.cover,
              image: new NetworkImage(
                  "https://i.pinimg.com/originals/12/e4/14/12e4144db4ba587c0c191d1b492bf262.jpg")
          )
      )),
);


class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;
  final double size;

  StarRating({this.starCount = 5, this.rating = .0,this.color, this.size=15});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon =  Icon(
        Icons.star_border,
        color: Colors.grey,
        size: size,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon =  Icon(
        Icons.star_half,
        color: color,
        size: size,
      );
    } else {
      icon =  Icon(
        Icons.star,
        color: color ,
        size: size,
      );
    }
    return  InkWell(
      onTap: ()=>(){},
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Row(children:  List.generate(starCount, (index) => buildStar(context, index)));
  }
}

var priceRow =  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text("\$224,344",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25)),
    FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 30),
      onPressed: () {},
      child: Text("Details", style: TextStyle(color: Colors.white)),
      color: RealEstate.themeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    ),
  ],
);

var facilities =   Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Column(
      children: [
        Image.network("https://image.flaticon.com/icons/png/512/148/148346.png",height: 50,width: 50,fit: BoxFit.fitHeight, color: RealEstate.themeColor,),
        SizedBox(height: 10,),
        Text("2",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
        SizedBox(height: 10,),
        Text("BATHROOM",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
      ],
    ),

    Container(height: 50, child: VerticalDivider(color: Colors.grey,width: 5,)),

    Column(
      children: [
        Image.network("https://img.icons8.com/pastel-glyph/2x/bed--v2.png",height: 50,width: 50,fit: BoxFit.fitHeight, color: RealEstate.themeColor),
        SizedBox(height: 10,),
        Text("2",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
        SizedBox(height: 10,),
        Text("BEDROOM",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
      ],
    ),

    Container(height: 50, child: VerticalDivider(color: Colors.grey,width: 5,)),


    Column(
      children: [
        Image.network("https://cdn3.iconfinder.com/data/icons/rent/100/Furnished-512.png",height: 50,width: 50,fit: BoxFit.fitHeight, color: RealEstate.themeColor),
        SizedBox(height: 10,),
        Text("2",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
        SizedBox(height: 10,),
        Text("LIVING ROOM",style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),),
      ],
    ),
  ],
);