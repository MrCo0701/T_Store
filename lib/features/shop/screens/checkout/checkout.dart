import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../cart/widgets/cart_item.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // * Item in cart
              const TCartItems(showAddRemoveButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              // * Coupon TextField
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // * Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    // * Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // * Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // * Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    TBillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
              image: TImages.successfulPaymentIcon,
              title: 'Payment Success',
              subtitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(() => const NavigationMenu()))),
          child: const Text('Checkout \$274.0'),
        ),
      ),
    );
  }
}
