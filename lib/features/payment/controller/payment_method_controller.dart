import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentMethodController =
    ChangeNotifierProvider<PaymentMethodController>((ref) {
  return PaymentMethodController();
});

class PaymentMethodController extends ChangeNotifier {
  PaymentMethodItem? selectedPaymentMethod;
  List<PaymentMethodItem> paymentMethods = [];

  init() {
    paymentMethods = [
      PaymentMethodItem(
        name: 'Online Payment',
        img: AppAssets.onlinePaymentIcon,
      ),
      PaymentMethodItem(
        name: 'Credit/Debit card',
        img: AppAssets.creditCard2Icon,
      ),
      PaymentMethodItem(
        name: 'Net Banking',
        img: AppAssets.netBankingIcon,
      ),
      PaymentMethodItem(
          name: 'Cash on Delivery', img: AppAssets.cashDeliveryIcon)
    ];
    selectedPaymentMethod = paymentMethods[0];
  }

  selectPaymentMethod(PaymentMethodItem method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }
}

class PaymentMethodItem {
  final String name;
  final String img;

  PaymentMethodItem({required this.name, required this.img});
}
