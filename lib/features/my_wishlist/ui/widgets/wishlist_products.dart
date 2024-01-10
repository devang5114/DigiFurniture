import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/features/my_wishlist/controller/my_wishlist_controller.dart';
import 'package:digifurniture/features/my_wishlist/ui/widgets/wishlist_products_card.dart';

class WishListProducts extends ConsumerWidget {
  const WishListProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishListWatch = ref.watch(myWishlistController);
    return Expanded(
      child: wishListWatch.wishListProducts.isNotEmpty
          ? ListView.builder(
              itemCount: wishListWatch.wishListProducts.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemBuilder: (context, index) {
                final product = wishListWatch.wishListProducts[index];
                return WishListProductCard(product);
              },
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No Items yet'),
                  SizedBox(height: 10.h),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                              side: const BorderSide(color: Colors.black45))),
                      onPressed: context.pop,
                      child: const Text('Add Product To WisList'))
                ],
              ),
            ),
    );
  }
}
