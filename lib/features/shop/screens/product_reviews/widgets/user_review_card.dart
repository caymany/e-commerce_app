import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/products/ratings/rating_indicator.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(DImages.userProfileImage1)),
                  const SizedBox(width: DSizes.spaceBtwItems),
                  Text('John Ndungu', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        /// Review
        Row(
          children: [
            const DRatingBarIndicator(rating: 4),
            Text('03 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: DSizes.spaceBtwItems),
        const ReadMoreText(
          'I have been using this application for a few weeks now, and I am incredibly impressed with how intuitive and user-friendly the interface is. The design is clean, and navigating through different features is a breeze. The UI adapts well to different devices, making it a seamless experience whether I am on my computer or mobile.',
          trimLines: 2,
          trimMode: TrimMode.Line,
            trimExpandedText: '...show less',
          trimCollapsedText: '...show more',
          moreStyle: TextStyle(color: DColors.primary),
          lessStyle: TextStyle(color: DColors.primary),
        ),
        const SizedBox(height: DSizes.spaceBtwItems),
        ///Company Review
        DRoundedContainer(
          backgroundColor: dark? DColors.darkerGrey : DColors.grey,

          child: Padding(
            padding: const EdgeInsets.all(DSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Devhub Kenya', style: Theme.of(context).textTheme.titleLarge),
                    Text('03 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: DSizes.spaceBtwItems),
                const ReadMoreText(
                  'Thank you so much for taking the time to share your valuable feedback with us. We are delighted to hear that you have had a positive experience with our application, and we appreciate your kind words about the intuitive and user-friendly nature of our interface.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: '...show less',
                  trimCollapsedText: '...show more',
                  moreStyle: TextStyle(color: DColors.primary),
                  lessStyle: TextStyle(color: DColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: DSizes.spaceBtwItems),
      ],

    );
  }
}
