import 'package:devhub_kenya/common/widgets/brands/brand_card.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DBrandShowCase extends StatelessWidget {
  const DBrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return DRoundedContainer(
      showBorder: true,
      borderColor: DColors.darkerGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(DSizes.md),
      margin: const EdgeInsets.only(bottom: DSizes.spaceBtwItems),
      child: Column(
        children: [
          const DBrandCard(showBorder: false),
          const SizedBox(height: DSizes.spaceBtwItems),

          /// Brand Images
          Row(
              children: images.map((image) =>
                  brandTopProductImageWidget(image, context)).toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: DRoundedContainer(
        height: 100,
        backgroundColor: DHelperFunctions.isDarkMode(context) ? DColors
            .darkerGrey : DColors.light,
        margin: const EdgeInsets.only(right: DSizes.sm),
        padding: const EdgeInsets.all(DSizes.md),
        child: Image(
            fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}