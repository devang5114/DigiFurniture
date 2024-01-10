import 'package:digifurniture/features/home/controller/most_popular_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/ui/widgets/most_popular/most_popular_products.dart';
import '../../most_popular_products/ui/widget/most_popular_products.dart';

final myWishlistController =
    ChangeNotifierProvider<MyWishlistController>((ref) {
  return MyWishlistController(ref);
});

class MyWishlistController extends ChangeNotifier {
  MyWishlistController(this.ref);
  Ref ref;
  List<ProductData> wishListProducts = [];

  addProduct(ProductData data, int i) {
    wishListProducts.add(data);
    notifyListeners();
  }

  removeProduct(ProductData product) {
    wishListProducts.remove(product);
    ref.read(mostPopularProductController).setFavourite(product, false);
    notifyListeners();
  }
}
