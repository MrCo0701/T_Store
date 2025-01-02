import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = false,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
    this.isSpaceBetween = false,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  final bool isSpaceBetween;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isSpaceBetween ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}