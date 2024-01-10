import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeController = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController();
});

class HomeController extends ChangeNotifier {
  int specialOfferImgIndex = 0;
  CarouselController carouselController = CarouselController();

  init() {}

  setSpecialOfferBanner(int i) {
    carouselController.animateToPage(i);
    specialOfferImgIndex = i;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
