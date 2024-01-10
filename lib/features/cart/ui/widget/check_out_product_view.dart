import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/ui/widget/promo_code_and_total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/shipping_address.dart';
import 'order_list.dart';
import 'shipping_address_widget.dart';

class CheckOutProductsView extends StatelessWidget {
  const CheckOutProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        child: Column(
          children: [
            const ShippingAddressWidget(),
            Divider(
              height: 10.h,
              color: Colors.grey.shade200,
            ),
            const OrderList(),
            Divider(
              height: 10.h,
              color: Colors.grey.shade200,
            ),
            const PromoCodeAndTotalPrice(),
          ],
        ),
      ),
    );
  }
}
