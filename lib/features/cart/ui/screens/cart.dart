import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/controller/cart_controller.dart';
import 'package:digifurniture/features/dasboard/controller/dasboard_controller.dart';

import '../widget/cart_view.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {
  @override
  void initState() {
    super.initState();
    ref.read(cartController).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60.h,
            width: context.screenWidth,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide.none,
                    horizontal:
                        BorderSide(color: Colors.grey.shade300, width: 1.w))),
            child: Text(
              "My Cart",
              style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
            ),
          ),
          const Expanded(child: CartView()),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            // boxShadow: [BoxShadow(color: Colors.grey.shade200)],
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ).marginOnly(bottom: 10.h),
                Text('₹ 1,155.00',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ).marginSymmetric(horizontal: 20.w, vertical: 15.h),
            CommonButton(
              onTap: () {
                context.pushNamed(AppRoutes.checkOutProducts);
              },
              btnText: 'Checkout',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              height: 55.h,
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
              ),
              fittedWidth: true,
            )
          ],
        ),
      ),
    );
  }
}
