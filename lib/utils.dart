import 'package:flutter/material.dart';

double baseHeight = 640.0;
double baseWidth = 320.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}

double screenAwareWidth(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.width / baseWidth;
}
