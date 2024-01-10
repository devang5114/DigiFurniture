import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/features/my_order/controller/my_order_controller.dart';
import 'package:digifurniture/features/my_order/ui/widgets/complete_order/complete_order_list.dart';
import 'package:digifurniture/features/my_order/ui/widgets/pending_order/pending_order_list.dart';

class CompleteOrder extends ConsumerWidget {
  const CompleteOrder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myOrderWatch = ref.watch(myOrderController);
    if (myOrderWatch.completedOrders.isEmpty) {
      return emptyPendingOrders;
    }
    return const CompleteOrderList();
  }

  Widget get emptyPendingOrders => Center(
        child: Column(
          children: [
            Image.asset(
              AppAssets.emptyOrders,
              height: 200.h,
              width: 200.w,
            ),
            Text(
              "You don't have an order yet",
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w700),
            ),
            Text(
              "You don't have an ongoing orders at this time",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
}
