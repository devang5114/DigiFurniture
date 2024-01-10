import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/controller/shipping_address_controller.dart';
import 'package:digifurniture/features/payment/controller/payment_controller.dart';
import 'package:digifurniture/features/payment/controller/payment_method_controller.dart';
import 'package:digifurniture/features/payment/ui/widgets/order_successfull_dialog.dart';
import 'package:digifurniture/features/payment/ui/widgets/payment_view.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../common/config/router/app_routes.dart';
import '../../../../common/utils/widgets/button.dart';
import '../widgets/payment_methods_view.dart';

class Payment extends ConsumerStatefulWidget {
  const Payment({super.key});

  @override
  ConsumerState<Payment> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends ConsumerState<Payment> {
  @override
  void initState() {
    super.initState();
    ref.read(paymentController).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: Column(
        children: [
          CommonAppBar(
            title: 'Payment',
          ),
          PaymentView()
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
            showGeneralDialog(
              barrierLabel: '',
              barrierDismissible: true,
              context: context,
              transitionDuration: 200.milliseconds,
              transitionBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
              pageBuilder: (context, animation, secondaryAnimation) {
                return const OrderSuccessFullDialog();
              },
            );
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
