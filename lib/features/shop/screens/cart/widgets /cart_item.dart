import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product%20/cart_controller.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemBuilder: (_, index) => Obx(() {
          final item = controller.cartItems[index];

          return Column(
            children: [
              TCartItem(cartItem: item),
              if (showAddRemoveButton) const SizedBox(height: TSizes.spaceBtwItems),
              if (showAddRemoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // * Extra space
                        const SizedBox(width: 70),
                        // * Add remove button
                        TProductQuantityRemoveAddButton(
                          quantity: item.quantity,
                          add: () => controller.addOneToCart(item),
                          remove: () => controller.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
