import 'package:flutter/cupertino.dart';

List<Room> roomList = [
  Room("https://www.garni-iris.com/typo3temp/pics/bd41e75200.jpg",
      "Bedroom in luxury home", 5, 170),
  Room("https://www.garni-iris.com/typo3temp/pics/bd41e75200.jpg",
      "Bedroom in luxury home", 5, 170),
  Room("https://www.garni-iris.com/typo3temp/pics/bd41e75200.jpg",
      "Bedroom in luxury home", 5, 170),
  Room("https://www.garni-iris.com/typo3temp/pics/bd41e75200.jpg",
      "Bedroom in luxury home", 5, 170),
];

class Room {
  String image;
  String title;
  double rating;
  double price;

  Room(this.image, this.title, this.rating, this.price);
}
