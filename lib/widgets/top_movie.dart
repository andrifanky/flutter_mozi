import 'package:flutter/material.dart';
import 'package:flutter_mozi/config/styles/styles.dart';
import 'package:flutter_mozi/widgets/star.dart';

class TopMovie extends StatelessWidget {
  const TopMovie({
    super.key,
    required this.image,
    required this.title,
    required this.rating
  });

  final String image;
  final String title;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: 190,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Image.asset(image)
            ),
          ),
          const SizedBox(height: 10),
          Text(title, style: poppins16Medium),
          const SizedBox(height: 5),
          Row(
            children: List.generate(5, (index) => Star().buildStar(rating, index))
          )
        ],
      ),
    );
  }
}
