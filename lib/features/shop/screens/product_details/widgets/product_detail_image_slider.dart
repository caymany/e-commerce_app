import 'package:devhub_kenya/common/widgets/appbar/appbar.dart';
import 'package:devhub_kenya/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:devhub_kenya/common/widgets/icons/d_circular_icon.dart';
import 'package:devhub_kenya/common/widgets/images/d_rounded_images.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/image_strings.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class DProductImageSlider extends StatelessWidget {
  const DProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);
    return DCurvedEdgesWidget(
      child: Container(
        color: dark ? DColors.darkerGrey : DColors.light,
        child: Stack(
          children: [

            ///Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding:
                EdgeInsets.all(DSizes.productImageRadius * 2),
                child: Center(
                    child:
                    Image(image: AssetImage(DImages.canonPrixma))),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: DSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: DSizes.spaceBtwItems),
                  itemBuilder: (_, index) => DRoundedImage(
                    width: 80,
                    border:Border.all(color : DColors.primary),
                    padding: const EdgeInsets.all(DSizes.sm),
                    imageUrl: DImages.canonG3420,
                    backgroundColor: dark ? DColors.dark : DColors.white,
                  ),
                ),
              ),
            ),
            const DAppBar(
              showBackArrow: true,
              actions: [
                DCircularIcon(icon: Iconsax.heart5, color: Colors.red,),
              ],
            )
          ],
        ),
      ),
    );
  }
}