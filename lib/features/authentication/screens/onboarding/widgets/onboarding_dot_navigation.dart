import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/controllers/onboarding/onboarding_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: TDeviceUtils.getAppBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
          controller: controller.pageController,
          count: 3,
          onDotClicked: controller.dotNavigationClick,
          effect: ExpandingDotsEffect(activeDotColor: dark ? TColors.light : TColors.black, dotHeight: 10, dotWidth: 22)
      ),
    );
  }
}