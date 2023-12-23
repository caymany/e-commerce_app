import 'package:devhub_kenya/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text('4.8',
                style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child:Column(
            children: [
              DRatingProgressIndicator(text: '5', value: 1.0),
              DRatingProgressIndicator(text: '4', value: 0.8),
              DRatingProgressIndicator(text: '3', value: 0.6),
              DRatingProgressIndicator(text: '2', value: 0.4),
              DRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}