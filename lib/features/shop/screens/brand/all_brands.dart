import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmer/brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;

    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // * Heading
              const TSectionHeading(title: 'Brands'),
              const SizedBox(height: TSizes.spaceBtwItems),

              // * Brands
              Obx(() {
                if (brandController.isLoading.value) return const TBrandShimmer();

                if (brandController.allBrands.isEmpty) {
                  return Center(
                      child: Text(
                    'No Data Found!',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                  ));
                }

                return TGridLayout(
                    mainAxisExtent: 80,
                    itemCount: brandController.allBrands.length,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return TBrandCard(showBorder: true, brand: brand);
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
