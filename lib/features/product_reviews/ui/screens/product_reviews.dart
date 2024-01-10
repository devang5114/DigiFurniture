import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/product_reviews/controller/product_reviews_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/product_reviews_view.dart';

class ProductReviews extends ConsumerStatefulWidget {
  const ProductReviews({super.key});

  @override
  ConsumerState<ProductReviews> createState() => _ProductReviewsState();
}

class _ProductReviewsState extends ConsumerState<ProductReviews> {
  @override
  void initState() {
    super.initState();
    ref.read(productReviewsController).init();
  }

  @override
  Widget build(BuildContext context) {
    final appString = ref.watch(appStringController);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CommonAppBar(
            title: appString.keyReviews,
          ),
          const Expanded(child: ProductReviewsView())
        ],
      ),
    ));
  }
}
