import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_test/custom_widgets/persian_text.dart';

class NewRatingBar extends StatelessWidget {
  final IconData? icon;
  final String? name;
  const NewRatingBar({Key? key, this.icon, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Card(
          margin: const EdgeInsets.all(10),
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon),
              PersianText(text: name),
              RatingBar.builder(
                // initialRating: 0,
                itemSize: 22,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          )
      ),
    );
  }
}
