import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/service/local_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/constants/app_const.dart';

final onBoardingController =
    ChangeNotifierProvider<OnBoardingController>((ref) {
  return OnBoardingController();
});

class OnBoardingController extends ChangeNotifier {
  PageController pageController = PageController();
  int index = 0;

  setPage(int i) {
    pageController.animateToPage(i,
        duration: 500.ms, curve: Curves.fastOutSlowIn);
    index = i;
  }

  onPageChange(int i) {
    index = i;
    notifyListeners();
  }

  nextPage(BuildContext context) {
    index++;
    if (index == 3) {
      notifyListeners();
      context.pushAndRemoveUntilNamed(AppRoutes.auth);
      LocalDb.instance.setBool(isIntroDone, true);
    } else {
      notifyListeners();
      pageController.animateToPage(index,
          duration: 500.ms, curve: Curves.fastOutSlowIn);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
