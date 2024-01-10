import 'package:digifurniture/features/home/controller/most_popular_products_controller.dart';
import 'package:digifurniture/features/home/ui/widgets/most_popular/most_popular_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../most_popular_products/ui/widget/most_popular_products.dart';

final myOrderController = ChangeNotifierProvider<MyOrderController>((ref) {
  return MyOrderController();
});

class MyOrderController extends ChangeNotifier {
  List<ProductData> pendingOrders = [];
  List<ProductData> completedOrders = [];

  init() {
    pendingOrders = dummyItems;
    completedOrders = dummyItems;
    notifyListeners();
  }
}
