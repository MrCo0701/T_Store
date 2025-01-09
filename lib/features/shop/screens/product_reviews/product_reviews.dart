import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/rating/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // * Appbar
      appBar:
          const TAppBar(title: Text('Review & Rating'), showBackArrow: true),

      // * Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and Reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: TSizes.spaceBtwItems),

              // * Overall Product Rating
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              // * User reviews list
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

