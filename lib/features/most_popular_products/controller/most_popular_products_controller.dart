import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mostPopularProductsController = ChangeNotifierProvider<MostPopularProductsController>((ref) {
  return MostPopularProductsController();
});

class MostPopularProductsController extends ChangeNotifier{}