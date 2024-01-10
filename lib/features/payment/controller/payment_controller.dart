import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentController = ChangeNotifierProvider<PaymentController>((ref) {
  return PaymentController();
});

class PaymentController extends ChangeNotifier {
  PaymentItem? selectedPaymentMethod;
  List<PaymentItem> paymentMethods = [];

  init() {
    paymentMethods = [
      PaymentItem(
        name: 'Razorpay',
        img: AppAssets.razorpayIcon,
      ),
      PaymentItem(
        name: 'PayU',
        img: AppAssets.payUIcon,
      ),
      PaymentItem(
        name: 'Instamojo',
        img: AppAssets.instaMojoIcon,
      ),
      PaymentItem(name: 'Paypal', img: AppAssets.paypalIcon)
    ];
    selectedPaymentMethod = paymentMethods[0];
  }

  selectPaymentMethod(PaymentItem method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }
}

class PaymentItem {
  final String name;
  final String img;

  PaymentItem({required this.name, required this.img});
}
