import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/constants/app_assets.dart';
import '../../home/ui/widgets/most_popular/most_popular_products.dart';
import '../../most_popular_products/ui/widget/most_popular_products.dart';

final productsController = ChangeNotifierProvider<ProductsController>((ref) {
  return ProductsController();
});

class ProductsController extends ChangeNotifier {
  String selectedFilter = 'All';
  List<ProductData> dummyItems = [
    ProductData('1', 'High quality chairs', AppAssets.product1, '₹ 4599',
        '₹ 5999', false, 'Sort'),
    ProductData('2', 'Grey sofa with two pillow', AppAssets.product2, '₹ 5699',
        '₹ 5999', false, 'Long'),
    ProductData('3', 'Grey sofa with two pillow', AppAssets.product3, '₹ 3999',
        '₹ 4999', false, 'Sort'),
    ProductData('4', 'Living room with blue', AppAssets.product4, '₹ 2999',
        '₹ 4999', false, 'Sort'),
    ProductData('5', 'Grey sofa with two pillow', AppAssets.product2, '₹ 5699',
        '₹ 5999', false, 'Sort'),
    ProductData('6', 'Grey sofa with two pillow', AppAssets.product3, '₹ 3999',
        '₹ 4999', false, 'Long'),
  ];

  init() {}
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
