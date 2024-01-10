import 'package:carousel_slider/carousel_slider.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/product_detail/controller/product_detail_controller.dart';

class ProductImagesSlider extends ConsumerWidget {
  const ProductImagesSlider(this.images, {super.key});
  final List<String> images;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetailWatch = ref.watch(productDetailController);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider(
            carouselController: productDetailWatch.carouselController,
            items: List.generate(images.length, (i) {
              final img = images[i];
              return Container(
                width: context.screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(img), fit: BoxFit.fill)),
                // child:
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: 300,
              onPageChanged: (index, reason) {
                productDetailWatch.setImageToSlider(index);
              },
              viewportFraction: 1.0,
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return productDetailWatch.productCurrentImageIndex == index
                ? Container(
                    height: 10.h,
                    width: 30.w,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadius.circular(10.r)),
                  )
                : GestureDetector(
                    onTap: () {
                      productDetailWatch.setImageToSlider(index);
                    },
                    child: Container(
                      height: 10.h,
                      width: 10.w,
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 0.5)),
                    ),
                  );
          }).toList(),
        ).marginOnly(bottom: 10.h),
      ],
    );
  }
}
