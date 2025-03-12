import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/data/dummy_data/dummy_data.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/list_tile/user_profile_title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final productRepository = Get.put(CategoryRepository());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //* Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                // * User profile card
                TUserProfileTile(
                  onTap: () => Get.to(const ProfileScreen()),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),

            // * Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(children: [
                // * Account Settings
                const TSectionHeading(title: 'Account Settings'),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                TSettingsMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Addresses',
                  subtitle: 'Set shopping delivery address',
                  onTap: () => Get.to(() => const UserAddressScreen()),
                ),

                TSettingsMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subtitle: 'Add, remove product and move to checkout',
                  onTap: () {},
                ),

                TSettingsMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Order',
                  subtitle: 'In-progress and Completed Orders',
                  onTap: () => Get.to(() => const OrderScreen()),
                ),

                TSettingsMenuTile(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subtitle: 'Withdraw balance to registered bank account',
                  onTap: () {},
                ),

                TSettingsMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'My Coupons',
                  subtitle: 'List of all the discounted coupons',
                  onTap: () {},
                ),

                TSettingsMenuTile(
                  icon: Iconsax.notification,
                  title: 'Notifications',
                  subtitle: 'Set any kind of notification message',
                  onTap: () {},
                ),

                TSettingsMenuTile(
                  icon: Iconsax.security_card,
                  title: 'Account Privacy',
                  subtitle: 'Manage data usage and connected accounts',
                  onTap: () {},
                ),

                // * App settings
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(
                    title: 'App Settings', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                TSettingsMenuTile(
                  icon: Iconsax.document_upload,
                  title: 'Load data',
                  subtitle: 'Upload Data to your Cloud Firebase',
                  onTap: () => productRepository.uploadDummyData(DummyData.categories),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.location,
                  title: 'Geolocation',
                  subtitle: 'Set recommendation based on location',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.security_user,
                  title: 'Safe mode',
                  subtitle: 'Search result is safe for all ages',
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                TSettingsMenuTile(
                  icon: Iconsax.image,
                  title: 'HD Image Quality',
                  subtitle: 'Set image quality to be seen',
                  trailing: Switch(value: false, onChanged: (value) {}),
                ),

                // ! Logout Button
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => controller.logout(),
                    child: const Text('Logout'),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections * 2.5,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
