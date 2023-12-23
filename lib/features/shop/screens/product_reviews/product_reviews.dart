import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/products/ratings/rating_indicator.dart';
import 'package:devhub_kenya/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:devhub_kenya/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductReviewScreeen extends StatelessWidget {
  const ProductReviewScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews verified by people who purchased our products"),
              const SizedBox(height: DSizes.spaceBtwItems),

              /// Overall Product Ratings
              const OverallProductRating(),
              const DRatingBarIndicator(rating: 3.5),
              Text('15', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: DSizes.spaceBtwSections),

              /// User Review List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}






