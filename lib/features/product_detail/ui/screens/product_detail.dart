import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';

import '../widgets/product_detail_view.dart';
import '../widgets/product_images_slider.dart';

class ProductDetail extends ConsumerWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const ProductImagesSlider([
                    AppAssets.productDetail,
                    AppAssets.productDetail,
                    AppAssets.productDetail,
                    AppAssets.productDetail,
                  ]),
                  Positioned(
                    top: 10,
                    left: 0,
                    right: 10,
                    child: CommonAppBar(
                      actionButtons: [
                        IconButton.filledTonal(
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            icon: Image.asset(
                              AppAssets.shareIcon,
                              color: context.colorScheme.primary,
                              height: 28.h,
                            ))
                      ],
                    ),
                  )
                ],
              ),
              const ProductDetailView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          children: [
            Expanded(
              child: CommonButton(
                onTap: () {},
                backgroundColor: Colors.white,
                border: Border.all(color: context.colorScheme.primary),
                btnText: 'Buy Now',
                icon: Image.asset(AppAssets.cart,
                        height: 25.h,
                        color: context.colorScheme.primary,
                        width: 25.w)
                    .marginOnly(right: 7.w),
                isIconButton: true,
                txtColor: context.colorScheme.primary,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 7.w),
            Expanded(
              child: CommonButton(
                backgroundColor: context.colorScheme.primary,
                onTap: () {},
                btnText: 'Add To Cart',
                icon: Image.asset(AppAssets.order,
                        color: Colors.white, height: 25.h, width: 25.w)
                    .marginOnly(right: 7.w),
                isIconButton: true,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
