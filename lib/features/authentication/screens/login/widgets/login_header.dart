import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(
              dark ? TImages.lightAppLogo : TImages.darkAppLogo),
          height: 150,
        ),
        Text(TTexts.loginTitle,
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.loginSubTitle,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium)
      ],
    );
  }
}
