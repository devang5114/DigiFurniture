import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDetailController =
    ChangeNotifierProvider<ProductDetailController>((ref) {
  return ProductDetailController();
});

class ProductDetailController extends ChangeNotifier {
  CarouselController carouselController = CarouselController();
  int productCurrentImageIndex = 0;
  int quantity = 0;
  int selectedColorIndex = 0;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  setImageToSlider(int i) {
    carouselController.animateToPage(i);
    productCurrentImageIndex = i;
    notifyListeners();
  }
}
