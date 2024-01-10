import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/my_order/controller/my_order_controller.dart';
import 'package:digifurniture/features/my_order/ui/widgets/pending_order/pending_order_list.dart';

class PendingOrders extends ConsumerWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myOrderWatch = ref.watch(myOrderController);
    // return emptyPendingOrders;
    if (myOrderWatch.pendingOrders.isEmpty) {
      return emptyPendingOrders;
    }
    return const PendingOrderList();
  }

  Widget get emptyPendingOrders => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.emptyOrders,
              height: 170.h,
              width: 170.w,
            ).marginOnly(bottom: 15.h),
            Text(
              "You don't have an order yet",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
            ).marginOnly(bottom: 10.h),
            Text(
              "You don't have an ongoing orders at this time",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
}
