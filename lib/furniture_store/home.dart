import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/furniture_store/Room.dart';
import 'package:flutter_ui/furniture_store/main.dart';

class RoomieHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoomieHomeApp();
  }
}

class RoomieHomeApp extends StatefulWidget {
  @override
  _RoomieHomeAppState createState() => _RoomieHomeAppState();
}

class _RoomieHomeAppState extends State<RoomieHomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    toolbar,
                    SizedBox(
                      height: 30,
                    ),
                    searchBar

                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: 65,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                child: bottomNav,
              ))
        ],
      )),
    );
  }
}

var toolbar = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(
      Icons.menu,
      size: 30,
    ),
    Icon(
      Icons.notifications_none,
      size: 30,
    )
  ],
);

var bottomNav = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Icon(Icons.dashboard),
    Icon(Icons.favorite_border),
    Icon(Icons.broken_image),
    Icon(Icons.person_outline)
  ],
);

var searchBar = Container(
  height: 45,
  child: Row(
    children: <Widget>[
      Expanded(
        flex: 17,
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            contentPadding: EdgeInsets.all(16),
            fillColor: Color(0xffdddddd),
          ),
        ),
      ),
      Expanded(
          flex: 3,
          child: Container(
            height: double.infinity,
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Icon(Icons.settings),
            decoration: BoxDecoration(
              color: FurnitureStore.themeColorGreen,
              borderRadius: BorderRadius.all(Radius.circular(13)),
            ),
          ))
    ],
  ),
);

var popularRooms = Container(
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: roomList.length,
    itemBuilder: (BuildContext context, int i) {
      return RoomItem(roomList[i]);
    },
  ),
);

class RoomItem extends StatelessWidget {
  Room room;

  RoomItem(this.room);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: 20),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              width: 200.0,
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.garni-iris.com/typo3temp/pics/bd41e75200.jpg")),
                borderRadius:
                BorderRadius.all(Radius.circular(20)),
              )),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "sdfdfd",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$170/night",
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(

                    padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(7)),
                        color: Color(0xfff2f2f2)),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 10,color: Colors.orange,
                        ),
                        Text(
                          "5.0",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
