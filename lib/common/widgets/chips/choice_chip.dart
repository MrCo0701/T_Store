import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
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
    final color = THelperFunctions.getColor(text);
    final isColor = color != null;
    final isDark = THelperFunctions.isDarkMode(context);

    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: color != null ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: isDark ? TColors.white : TColors.black),
        avatar: color != null
            ? const TCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: Colors.green,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        selectedColor: isColor ? color : null,
        backgroundColor: isColor ? color : null,
        disabledColor: isColor ? color.withOpacity(0.3) : null,
      ),
    );
  }
}
