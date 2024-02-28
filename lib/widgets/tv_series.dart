import 'package:flutter/material.dart';
import 'package:flutter_mozi/config/styles/styles.dart';
import 'package:flutter_mozi/widgets/star.dart';

class TVSeries extends StatelessWidget {
  const TVSeries({
    super.key,
    required this.image,
    required this.genre,
    required this.title,
    required this.rating,
    required this.onTap
  });

  final String image;
  final String genre;
  final String title;
  final double rating;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: InkWell(
        borderRadius: BorderRadius.circular(defaultRadius),
        onTap: () {
          onTap();
        },
        child: Row(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Hero(
                tag: 'tvSeriesHero_$title',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Image.asset(image)
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(genre, style: poppins12Regular.copyWith(color: darkGreyColor)),
                const SizedBox(height: 5),
                Text(title, style: poppins16Medium),
                const SizedBox(height: 5),
                Row(
                  children: List.generate(5, (index) => Star().buildStar(rating, index))
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
