import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/home/ui/widgets/most_popular/most_popular_products.dart';

import '../../../../../common/config/theme/app_string.dart';
import '../../../home/controller/most_popular_products_controller.dart';
import '../../../product_detail/ui/screens/product_detail.dart';
import 'most_popular_products.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard(this.index, {required this.product, super.key});
  final ProductData product;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularProductWatch = ref.watch(mostPopularProductController);
    final appString = ref.watch(appStringController);

    return GestureDetector(
      onTap: () {
        context.push(const ProductDetail());
      },
      child: SizedBox(
        width: context.screenWidth * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 150.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                      image: AssetImage(
                        product.img,
                      ),
                      fit: BoxFit.cover)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.r))),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                    child: Text(
                      '20%${appString.keyOff}',
                      style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Spacer(),
                  IconButton.filledTonal(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white)),
                      iconSize: 20.sp,
                      onPressed: () {
                        popularProductWatch.toggleFavourite(index);
                      },
                      icon: Icon(
                        product.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: product.isFavourite ? Colors.red : Colors.black,
                      ))
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              product.name,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Icon(
                  Icons.star_half_rounded,
                  color: context.colorScheme.primary,
                  size: 15.sp,
                ),
                Text(
                  ' 4.5 (221)',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  product.price,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                ).marginOnly(top: 8.h, right: 5.w),
                Text(
                  product.discountPrice,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.lineThrough),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
