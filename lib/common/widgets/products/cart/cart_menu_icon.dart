import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product /cart_controller.dart';
import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = THelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration:
                  BoxDecoration(color: TColors.black.withOpacity(0.8), borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Obx(
                  () => Text(controller.noOfCartItems.value.toString(),
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color: counterTextColor ?? (dark ? TColors.black : TColors.white), fontSizeFactor: 0.8)),
                ),
              ),
            ))
      ],
    );
  }
}
