import 'package:devhub_kenya/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:devhub_kenya/utils/constants/colors.dart';
import 'package:devhub_kenya/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

/// Rest of the style is already done in CHIPTHEME.DART
class DChoiceChip extends StatelessWidget {
  const DChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = DHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor? const SizedBox(): Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? DColors.white : null),
        avatar: isColor? DCircularContainer(width: 40,height: 40,backgroundColor: DHelperFunctions.getColor(text)!) : null,
        labelPadding: isColor  ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor  ? const CircleBorder() : null,
        backgroundColor: isColor ? DHelperFunctions.getColor(text) : null,
      ),
    );
  }
}
