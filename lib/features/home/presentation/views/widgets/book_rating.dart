import 'package:bookly_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.start, required this.bookRating, required this.count});

  final num bookRating;
  final int count;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children:  [
       const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
       const SizedBox(
          width: 6.3,
        ),
        Text(
          count.toString(),
          style: Styles.textStyle16,
        ),
      const  SizedBox(
          width: 5,
        ),
        Opacity(
          opacity: .5,
          child: Text('($bookRating)', style: Styles.textStyle14),
        ),
      ],
    );
  }
}
