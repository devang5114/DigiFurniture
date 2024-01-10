import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/cart/controller/cart_controller.dart';
import 'package:digifurniture/features/cart/ui/widget/cart_item_card.dart';

class OrderList extends ConsumerWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartWatch = ref.watch(cartController);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Address',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ).marginOnly(bottom: 15.h),
        ...cartWatch.dummyData.map((e) => CartItemCard(e))
      ],
    ).marginSymmetric(vertical: 20.h);
  }
}
