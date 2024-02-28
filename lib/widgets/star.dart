import 'package:flutter/material.dart';
import 'package:flutter_mozi/config/styles/styles.dart';

class Star {

  Widget buildStar(double rating, int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(Icons.star_border_rounded, color: orangeColor);
    } else if (index > rating - 1 && index < rating) {
      icon = const Icon(Icons.star_half_rounded, color: orangeColor);
    } else {
      icon = const Icon(Icons.star_rounded, color: orangeColor);
    }
    return icon;
  }
}