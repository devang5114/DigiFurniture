import 'package:digifurniture/features/cart/controller/cart_controller.dart';
import 'package:digifurniture/features/home/controller/home_controller.dart';
import 'package:digifurniture/features/my_order/controller/my_order_controller.dart';
import 'package:digifurniture/features/products/controller/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dasboardController = ChangeNotifierProvider<DasboardController>((ref) {
  return DasboardController(ref);
});

class DasboardController extends ChangeNotifier {
  DasboardController(this.ref);
  Ref ref;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  int index = 0;
  bool isBottomNavVisible = true;

  openDrawer() {
    key.currentState!.openDrawer();
    notifyListeners();
  }

  initHomeTab(ScrollController controller) {
    controller.addListener(() {
      final direction = controller.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        isBottomNavVisible = true;
        notifyListeners();
      } else if (direction == ScrollDirection.reverse) {
        isBottomNavVisible = false;
        notifyListeners();
      }
    });
  }

  initCartTab(ScrollController controller) {
    controller.addListener(() {
      final direction = controller.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        isBottomNavVisible = true;
        notifyListeners();
      } else if (direction == ScrollDirection.reverse) {
        isBottomNavVisible = false;
        notifyListeners();
      }
    });
  }

  initProductsTab(ScrollController controller) {
    controller.addListener(() {
      final direction = controller.position.userScrollDirection;
      if (direction == ScrollDirection.forward) {
        isBottomNavVisible = true;
        notifyListeners();
      } else if (direction == ScrollDirection.reverse) {
        isBottomNavVisible = false;
        notifyListeners();
      }
    });
  }

  closeDrawer() {
    key.currentState!.closeDrawer();
  }

  setPage(int i) {
    index = i;
    notifyListeners();
  }
}
