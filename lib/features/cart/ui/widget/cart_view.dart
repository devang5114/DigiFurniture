import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/cart/controller/cart_controller.dart';
import 'package:digifurniture/features/cart/ui/widget/cart_item_card.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartWatch = ref.watch(cartController);
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      itemCount: cartWatch.dummyData.length,
      itemBuilder: (context, index) {
        final product = cartWatch.dummyData[index];
        return CartItemCard(product);
      },
    );
  }
}
