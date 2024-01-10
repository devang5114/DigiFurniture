import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/my_order/controller/my_order_controller.dart';
import 'package:digifurniture/features/my_order/ui/widgets/complete_order/completed_order_card.dart';

class CompleteOrderList extends ConsumerWidget {
  const CompleteOrderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myOrderWatch = ref.watch(myOrderController);
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      itemCount: myOrderWatch.completedOrders.length,
      itemBuilder: (context, i) {
        final product = myOrderWatch.completedOrders[i];
        return CompleteOrderCard(product);
      },
    );
  }
}
