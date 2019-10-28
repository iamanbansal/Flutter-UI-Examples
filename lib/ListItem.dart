import 'package:flutter_ui/ShoesShop/main.dart';
import 'package:flutter_ui/everlance/main.dart';
import 'package:flutter_ui/flutter_stroy/main.dart';
import 'package:flutter_ui/greenary/main.dart';
import 'package:flutter_ui/pizza_store/main.dart';
import 'package:flutter_ui/rent_car/main.dart';

class ListItem {
  String name, route;

  ListItem(this.name, this.route);
}

List<ListItem> uiList = [
  ListItem("Flutter Story", FlutterStory.routeName),
  ListItem("Shoe Store", ShoesShop.routeName),
  ListItem("Pizza Store", PizzaStore.routeName),
  ListItem("Greenery App", GreeneryApp.routeName),
  ListItem("Rent Car", RentCar.routeName),
  ListItem("EverLance", EverLance.routeName),
];
