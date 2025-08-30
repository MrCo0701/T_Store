import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/product%20/cart_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_details/product_detail.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/enum/enum.dart';

class ProductAddToCartButton extends StatelessWidget {
  const ProductAddToCartButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return GestureDetector(
      onTap: () {
        if (product.productType != ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

        return Container(
          decoration: BoxDecoration(
              color: productQuantityInCart > 0 ? TColors.primary : TColors.dark,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(TSizes.cardRadiusMd),
                  bottomRight: Radius.circular(TSizes.productImageRadius))),
          child: SizedBox(
              height: TSizes.iconLg * 1.2,
              width: TSizes.iconLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0
                      ? Text(productQuantityInCart.toString(),
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white))
                      : const Icon(
                          Iconsax.add,
                          color: TColors.white,
                        ))),
        );
      }),
    );
  }
}
