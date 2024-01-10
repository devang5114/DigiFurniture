import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/home/ui/widgets/most_popular/most_popular_products.dart';
import 'package:digifurniture/features/my_order/ui/widgets/complete_order/review_order_bottom_sheet.dart';

import '../../../../most_popular_products/ui/widget/most_popular_products.dart';

class CompleteOrderCard extends ConsumerWidget {
  const CompleteOrderCard(this.product,
      {this.isFromReviewSheet = false, super.key});
  final ProductData product;
  final bool isFromReviewSheet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: 13.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 7.r,
                    ),
                    Text(
                      '  Color   |  Size : M |  Qty : 1',
                      style: TextStyle(
                          fontSize: 11.sp, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 7.h),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5.r)),
                  padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 8.h),
                  child: Text(
                    'Completed',
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price}.00',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w800),
                    ),
                    if (!isFromReviewSheet)
                      InkWell(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) =>
                                ReviewOrderBottomSheet(product),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              borderRadius: BorderRadius.circular(5.r)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 11.w, vertical: 10.h),
                          child: Text(
                            'Review',
                            style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
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
