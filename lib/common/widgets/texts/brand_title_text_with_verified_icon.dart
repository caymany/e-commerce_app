
import 'package:devhub_kenya/common/widgets/texts/brand_title_text.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/enums.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DBrandTitleWithVerifiedIcon extends StatelessWidget {
  const DBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor = DColors.primary,
    this.iconColor = DColors.primary,
    this.textAlign,
    this.brandTextSizes = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: DBrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize: brandTextSizes,
        ),
        ),
        const SizedBox(width: DSizes.xs),
        const Icon(Iconsax.verify5,
            color: DColors.primary, size: DSizes.iconXs),
      ],
    );
  }
}
