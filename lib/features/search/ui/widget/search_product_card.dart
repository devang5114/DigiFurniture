import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/home/ui/widgets/most_popular/most_popular_products.dart';

import '../../../most_popular_products/ui/widget/most_popular_products.dart';

class SearchProductCard extends ConsumerWidget {
  const SearchProductCard(this.product, {super.key});
  final ProductData product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRoutes.productDetail);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Colors.black12)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80.h,
              width: 100.w,
              child: FittedBox(child: Image.asset(product.img)),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 7.h),
                  Row(
                    children: [
                      Text(
                        product.price,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w700),
                      ).marginOnly(right: 5.w),
                      Text(
                        product.discountPrice,
                        style: TextStyle(
                            fontSize: 11.sp,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
