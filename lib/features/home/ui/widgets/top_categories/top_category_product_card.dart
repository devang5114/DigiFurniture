import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/home/ui/widgets/top_categories/top_categories_products.dart';

import '../furniture_categorys_widget.dart';

class TopCategoryProductCard extends ConsumerWidget {
  const TopCategoryProductCard(this.product, {super.key});
  final TopCategoryProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.push(Demo(product.title));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 180.h,
            alignment: AlignmentDirectional.bottomCenter,
            width: context.screenWidth * 0.45,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(product.image), fit: BoxFit.fill)),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
                margin: EdgeInsets.only(bottom: 5.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Text(
                  product.discount,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                )),
          ),
          SizedBox(height: 7.h),
          Text(product.title,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600)),
          SizedBox(height: 3.h),
          Text(
            product.desc,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey),
          )
        ],
      ),
    );
  }
}
