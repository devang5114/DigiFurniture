import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/controller/shipping_address_controller.dart';

import '../../../../common/config/router/app_routes.dart';
import '../../../../common/utils/widgets/button.dart';
import '../widget/check_out_product_view.dart';
import '../widget/order_list.dart';
import '../widget/shipping_address_view.dart';
import '../widget/shipping_address_widget.dart';
import 'check_out_product.dart';

class ShippingAddress extends ConsumerStatefulWidget {
  const ShippingAddress({super.key});

  @override
  ConsumerState<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends ConsumerState<ShippingAddress> {
  @override
  void initState() {
    super.initState();
    ref.read(shippingAddressController).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: Column(
        children: [
          CommonAppBar(
            title: 'Shipping Address',
          ),
          ShippingAddressView()
        ],
      )),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            // boxShadow: [BoxShadow(color: Colors.grey.shade200)],
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        child: CommonButton(
          onTap: context.pop,
          btnText: 'Apply',
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
