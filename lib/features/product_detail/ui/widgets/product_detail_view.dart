import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/product_detail/ui/widgets/product_detail_text.dart';
import 'package:digifurniture/features/product_detail/ui/widgets/product_name_and_price_widget.dart';
import 'package:digifurniture/features/product_detail/ui/widgets/product_size_and_color_selection_widget.dart';

import '../../../../common/utils/constants/app_assets.dart';
import '../../../home/ui/widgets/most_popular/most_popular_products.dart';
import '../../../most_popular_products/ui/widget/most_popular_products.dart';
import 'about_this_product_widget.dart';

class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ProductData productData = ProductData('5', 'Grey sofa with two pillow',
        AppAssets.product2, '₹ 5699', '₹ 5999', false, 'Sort');
    return Column(
      children: [
        const ProductNameAndPrice()
            .marginSymmetric(horizontal: 15.w, vertical: 10.h),
        Divider(
          color: Colors.grey.shade400,
          height: 40.h,
        ).marginSymmetric(horizontal: 15.w, vertical: 10.h),
        const AboutThisProductWidget()
            .marginSymmetric(horizontal: 15.w, vertical: 10.h),
        const ProductDetailText()
            .marginSymmetric(horizontal: 15.w, vertical: 10.h),
        const ProductSizeAndColorSelectionWidget()
      ],
    );
  }
}
