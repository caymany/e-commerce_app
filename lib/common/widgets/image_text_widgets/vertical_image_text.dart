import 'package:devhub_kenya/common/widgets/images/d_circular_images.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DVerticalImageText extends StatelessWidget {
  const DVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = DColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: DSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icons

            DCircularImage(
              image: image,
              fit: BoxFit.fitHeight,
              padding: DSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: DHelperFunctions.isDarkMode(context) ? DColors.light : DColors.dark,
            ),
            const SizedBox(height: DSizes.spaceBtwItems / 2),

            /// Text Below icon
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
