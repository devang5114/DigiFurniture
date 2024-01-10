import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/controller/shipping_address_controller.dart';
import 'package:digifurniture/features/payment/controller/payment_method_controller.dart';

import '../../../../common/config/router/app_routes.dart';
import '../../../../common/utils/widgets/button.dart';
import '../widgets/payment_methods_view.dart';

class PaymentMethods extends ConsumerStatefulWidget {
  const PaymentMethods({super.key});

  @override
  ConsumerState<PaymentMethods> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends ConsumerState<PaymentMethods> {
  @override
  void initState() {
    super.initState();
    ref.read(paymentMethodController).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: Column(
        children: [
          CommonAppBar(
            title: 'Payment Methods',
          ),
          PayMentMethodsView()
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
            context.pushNamed(AppRoutes.payment);
          },
          btnText: 'Continue',
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
