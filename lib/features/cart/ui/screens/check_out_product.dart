import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/config/router/app_routes.dart';
import '../../../../common/utils/widgets/button.dart';
import '../widget/check_out_product_view.dart';
import '../widget/order_list.dart';
import '../widget/shipping_address_widget.dart';

class CheckOutProducts extends ConsumerStatefulWidget {
  const CheckOutProducts({super.key});

  @override
  ConsumerState<CheckOutProducts> createState() => _CheckOutProductState();
}

class _CheckOutProductState extends ConsumerState<CheckOutProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: Column(
        children: [
          CommonAppBar(
            title: 'Checkout',
            color: Colors.white,
          ),
          CheckOutProductsView()
        ],
      )),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            // boxShadow: [BoxShadow(color: Colors.grey.shade200)],
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        child: CommonButton(
          onTap: () {
            context.pushNamed(AppRoutes.paymentMethod);
          },
          btnText: 'Continue to Payment',
          fontSize: 15.sp,
          height: 55.h,
          fontWeight: FontWeight.w600,
          padding: EdgeInsets.symmetric(
            horizontal: 40.w,
          ),
        ),
      ),
    );
  }
}
