import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/my_order/controller/my_order_controller.dart';
import 'package:digifurniture/features/my_order/ui/widgets/pending_order/pending_ordere_card.dart';

class PendingOrderList extends ConsumerWidget {
  const PendingOrderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myOrderWatch = ref.watch(myOrderController);
    return ListView.builder(
      itemCount: myOrderWatch.pendingOrders.length,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      itemBuilder: (context, i) {
        final product = myOrderWatch.pendingOrders[i];
        return PendingOrderCard(product);
      },
    );
  }
}
