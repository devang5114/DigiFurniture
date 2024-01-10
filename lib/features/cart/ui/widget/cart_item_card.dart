import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/features/cart/controller/cart_controller.dart';
import 'package:digifurniture/features/cart/ui/widget/remove_product_bottom_sheet.dart';
import 'package:digifurniture/features/home/ui/widgets/most_popular/most_popular_products.dart';

import '../../../../common/utils/constants/app_assets.dart';
import '../../../most_popular_products/ui/widget/most_popular_products.dart';

class CartItemCard extends ConsumerWidget {
  const CartItemCard(this.product, {super.key});
  final ProductData product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
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
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 7.r,
                              ),
                              Text(
                                '  Color   |  Size : ${product.size}',
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return RemoveProductBottomSheet(product);
                            },
                          );
                        },
                        icon: Image.asset(
                          AppAssets.deleteIcon,
                          height: 20.h,
                          width: 20.w,
                        ))
                  ],
                ),
                SizedBox(height: 15.h),
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
                    Spacer(),
                    Container(
                      height: 35.h,
                      margin: EdgeInsets.only(left: 15.w, right: 15.w),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                // style: IconButton.styleFrom(
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //             BorderRadius.circular(10.r))),
                                onPressed: () {
                                  // productDetailWatch.quantity++;
                                  // productDetailWatch.notifyListeners();
                                },
                                icon: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )),
                            SizedBox(width: 6.w),
                            Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 6.w),
                            IconButton(
                                // style: IconButton.styleFrom(
                                //     shape: RoundedRectangleBorder(
                                //         borderRadius:
                                //             BorderRadius.circular(10.r))),
                                onPressed: () {
                                  // productDetailWatch.quantity++;
                                  // productDetailWatch.notifyListeners();
                                },
                                icon: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )),
                          ],
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
