import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/features/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/ui/widgets/most_popular/most_popular_products.dart';
import '../../most_popular_products/ui/widget/most_popular_products.dart';

final viewOrderController = ChangeNotifierProvider<ViewOrderController>((ref) {
  return ViewOrderController(ref);
});

class ViewOrderController extends ChangeNotifier {
  ViewOrderController(this.ref);
  Ref ref;
  List<ProductData> products = [];
  init() {
    products = ref.watch(cartController).dummyData;
  }
}
