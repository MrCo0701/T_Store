import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/shimmer/brand_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../brand/all_brands.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [TCartCounterIcon(onPressed: () {}, iconColor: Colors.black)],
        ),
        body: NestedScrollView(
          // * ==> Dung de kiem soat nhung scroll view de khong bi xung dot nhau
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  // * ==> Appbar co the tuy chinh kich thuoc
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // * Search bar
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchContainer(
                          text: 'Search in store',
                          showBorder: true,
                          showBackground: false,
                          icon: Iconsax.search_normal,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),

                        // * Featured brands
                        TSectionHeading(
                          title: 'Feature brands',
                          showActionButton: true,
                          onPressed: () => Get.to(() => const AllBrandsScreen()),
                          isSpaceBetween: true,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),

                      Obx(() {
                        if (brandController.isLoading.value) return const TBrandShimmer();

                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                              child: Text(
                            'No Data Found!',
                            style:
                                Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                          ));
                        }

                        return TGridLayout(
                            mainAxisExtent: 80,
                            itemCount: brandController.featuredBrands.length,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];
                              return TBrandCard(
                                showBorder: true,
                                brand: brand,
                                onTap: () => Get.to(() => BrandProducts(brand: brand)),
                              );
                            });
                      })
                    ],
                    ),
                  ),

                  //* Tabs
                bottom: TTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              )
            ];
          },

          //* Body
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
