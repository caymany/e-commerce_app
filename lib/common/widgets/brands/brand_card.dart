import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/common/widgets/images/d_circular_images.dart';
import 'package:devhub_kenya/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/enums.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DBrandCard extends StatelessWidget {
  const DBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = DHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap : onTap,
      child: DRoundedContainer(
        padding: const EdgeInsets.all(DSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// ICon
            Flexible(
              child: DCircularImage(
                isNetworkImage: false,
                image: DImages.darkAppLogo,
                backgroundColor: Colors.transparent,
                overlayColor: DHelperFunctions.isDarkMode(context)
                    ? DColors.white
                    : DColors.black,
              ),
            ),
            const SizedBox(width: DSizes.spaceBtwItems),

            /// Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DBrandTitleWithVerifiedIcon(
                      title: 'Canon', brandTextSizes: TextSizes.large),
                  Text('255',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
