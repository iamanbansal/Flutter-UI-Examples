import 'package:flutter/material.dart';
import 'package:flutter_ui/real_estate/data.dart';
import 'package:flutter_ui/real_estate/details.dart';

class RealEstate extends StatelessWidget {
  static const routeName = 'real_estate';
  static const themeColor = Color(0xFFA95AEA);

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
      bottomNavigationBar: BottomBarWidget(),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(padding: EdgeInsets.only(right: 20), child: toolbar),
              SizedBox(
                height: 20,
              ),
              Padding(padding: EdgeInsets.only(right: 20), child: searchBar),
              SizedBox(
                height: 20,
              ),
              Padding(padding: EdgeInsets.only(right: 20), child: buyAndRent),
              SizedBox(
                height: 20,
              ),
              categories,
              SizedBox(
                height: 20,
              ),
              nearby
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBarWidget extends StatefulWidget {
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _selectedIndex = 0;
  Color selectedColor = RealEstate.themeColor;
  Color unSelectedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        height: 60.0,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0)),
            color: Colors.white),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          InkWell(
            onTap: () => _onTap(0),
            child: Column(
              children: [
                Icon(Icons.home,
                    color:
                        _selectedIndex == 0 ? selectedColor : unSelectedColor),
                Text("Home",
                    style: TextStyle(
                        color: _selectedIndex == 0
                            ? selectedColor
                            : unSelectedColor))
              ],
            ),
          ),
          InkWell(
            onTap: () => _onTap(1),
            child: Column(
              children: [
                Icon(Icons.chat_bubble_outline,
                    color:
                        _selectedIndex == 1 ? selectedColor : unSelectedColor),
                Text("Comments",
                    style: TextStyle(
                        color: _selectedIndex == 1
                            ? selectedColor
                            : unSelectedColor))
              ],
            ),
          ),
          InkWell(
            onTap: () => _onTap(2),
            child: Column(
              children: [
                Icon(Icons.favorite_border,
                    color:
                        _selectedIndex == 2 ? selectedColor : unSelectedColor),
                Text("Save",
                    style: TextStyle(
                        color: _selectedIndex == 2
                            ? selectedColor
                            : unSelectedColor))
              ],
            ),
          ),
          InkWell(
            onTap: () => _onTap(3),
            child: Column(
              children: [
                Icon(Icons.notifications_none,
                    color:
                        _selectedIndex == 3 ? selectedColor : unSelectedColor),
                Text("Notifications",
                    style: TextStyle(
                        color: _selectedIndex == 3
                            ? selectedColor
                            : unSelectedColor))
              ],
            ),
          ),
        ]));
  }

  void _onTap(int tapIndex) {
    setState(() {
      _selectedIndex = tapIndex;
    });
  }
}

var toolbar = Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      "Browse",
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
    ),
    Icon(
      Icons.location_on,
      color: RealEstate.themeColor,
      size: 30,
    )
  ],
);

var searchBar = Container(
    height: 45,
    child: TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Search',
        hintStyle: TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(16),
        fillColor: Color(0xffdddddd),
      ),
    ));

var buyAndRent = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    FlatButton(
      onPressed: () {},
      child: Text(
        "BUY",
        style: TextStyle(color: Colors.grey[500]),
      ),
      color: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    ),
    SizedBox(width: 10),
    FlatButton(
      onPressed: () {},
      child: Text("RENT", style: TextStyle(color: Colors.white)),
      color: RealEstate.themeColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    ),
  ],
);

var categories = Column(
  children: [
    Padding(
      padding: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          Text(
            "See All \u203A",
            style: TextStyle(color: RealEstate.themeColor),
          ),
        ],
      ),
    ),
    SizedBox(height: 10),
    SizedBox(
      height: 120,
      child: ListView.builder(
        itemBuilder: (context, position) {
          return CategoryWidget(categoryList[position]);
        },
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    ),
  ],
);

class CategoryWidget extends StatelessWidget {
  final Category category;

  CategoryWidget(this.category);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Container(
              width: 100.0,
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(category.image)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          child: Text(
            category.name,
            style: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

var nearby = Column(
  children: [
    Padding(
      padding: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Nearby",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          ),
          Text(
            "See All \u203A",
            style: TextStyle(color: RealEstate.themeColor),
          ),
        ],
      ),
    ),
    SizedBox(height: 10),
    SizedBox(
      height: 120,
      child: ListView.builder(
        itemBuilder: (context, position) {
          return NearbyWidget(nearbyList[position]);
        },
        itemCount: nearbyList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    ),
  ],
);

class NearbyWidget extends StatelessWidget {
  final String image;

  NearbyWidget(this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RealEstateDetails(image)));
      },
      child: Hero(
        tag: image,
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Container(
              width: 210.0,
              height: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(image)),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              )),
        ),
      ),
    );
  }
}
