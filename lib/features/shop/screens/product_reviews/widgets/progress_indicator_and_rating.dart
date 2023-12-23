import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class DRatingProgressIndicator extends StatelessWidget {
  const DRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium)),
        Expanded(
          flex: 9,
          child: SizedBox(
            width: DDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: DColors.grey,
              valueColor: const AlwaysStoppedAnimation(DColors.primary),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),
      ],
    );
  }
}