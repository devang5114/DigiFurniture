import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/filter/ui/widgets/rating_filters.dart';
import 'package:digifurniture/features/product_reviews/controller/product_reviews_controller.dart';
import 'package:digifurniture/features/product_reviews/ui/widgets/reviews_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductReviewsView extends ConsumerWidget {
  const ProductReviewsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    return const Column(
      children: [RatingBar(), ReviewsList()],
    );
  }
}

class RatingBar extends ConsumerWidget {
  const RatingBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewsWatch = ref.watch(productReviewsController);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(reviewsWatch.ratings.length, (i) {
          final filter = reviewsWatch.filters![i];
          return FilterChip(
            // padding: EdgeInsets.symmetric(horizontal:),
            avatar: Icon(Icons.star,
                color: filter.name == reviewsWatch.selectedRating
                    ? Colors.white
                    : Colors.black),
            selectedColor: context.colorScheme.primary,
            selected: filter.name == reviewsWatch.selectedRating,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
                side: const BorderSide(color: Colors.red)),
            backgroundColor: Colors.white,
            label: Text(
              filter.name,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: filter.name == reviewsWatch.selectedRating
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            showCheckmark: false,
            onSelected: (value) {
              reviewsWatch.onChangeRatingFilter(i, filter.name);
            },
          ).marginOnly(left: 5.w);
        }),
      ),
    );
  }
}
