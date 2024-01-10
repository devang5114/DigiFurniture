import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';

import '../../../home/ui/widgets/most_popular/most_popular_products.dart';
import '../../../most_popular_products/ui/widget/most_popular_products.dart';
import '../../controller/my_wishlist_controller.dart';

class WishListProductCard extends ConsumerWidget {
  const WishListProductCard(this.product, {super.key});
  final ProductData product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    final wishListWatch = ref.watch(myWishlistController);

    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.black12)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: FittedBox(child: Image.asset(product.img)),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Size : ${product.size}',
                            style: TextStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          wishListWatch.removeProduct(product);
                        },
                        icon: Image.asset(
                          AppAssets.deleteIcon,
                          height: 20.h,
                          width: 20.w,
                        ))
                  ],
                ),
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.price,
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          product.discountPrice,
                          style: TextStyle(
                              fontSize: 11.sp,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5.r)),
                        padding: EdgeInsets.symmetric(
                            horizontal: 9.w, vertical: 8.h),
                        child: Text(
                          appString.keyAddToCart,
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
