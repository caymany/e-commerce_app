import 'package:devhub_kenya/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DCouponCode extends StatelessWidget {
  const DCouponCode({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return DRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? DColors.dark : DColors.light,
      padding: const EdgeInsets.only(
          top: DSizes.sm,
          bottom: DSizes.sm,
          right: DSizes.sm,
          left: DSizes.md),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo Code, Enter Here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
              width: 80,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    foregroundColor: dark ? DColors.white.withOpacity(0.5) : DColors.dark.withOpacity(0.5),
                    backgroundColor: DColors.grey.withOpacity(0.2),
                    side: BorderSide(color: DColors.grey.withOpacity(0.1)),
                  ),
                  child: const Text('Apply')))
        ],
      ),
    );
  }
}