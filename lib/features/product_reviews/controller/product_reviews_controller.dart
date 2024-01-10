import 'package:digifurniture/features/filter/controller/search_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productReviewsController =
    ChangeNotifierProvider<ProductReviewsController>((ref) {
  return ProductReviewsController();
});

class ProductReviewsController extends ChangeNotifier {
  final ratings = ['5', '4', '3', '2', '1'];
  List<Filter>? filters;
  String selectedRating = '5';
  init() {
    filters = List.generate(ratings.length,
        (index) => Filter(id: index.toString(), name: ratings[index])).toList();
  }

  onChangeRatingFilter(int i, String val) {
    selectedRating = val;
    notifyListeners();
  }
}
