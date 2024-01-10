import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digifurniture/features/home/controller/home_controller.dart';

class SpecialOfferWidget extends ConsumerWidget {
  const SpecialOfferWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    return SizedBox(
      height: context.screenHeight * 0.35,
      child: Column(
        children: [
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appString.keySpecialOffers,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    appString.keySeeAll,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
                  ))
            ],
          ).paddingHorizontal(20.w),
          const SpecialOfferSlider()
        ],
      ),
    );
  }
}

class SpecialOfferSlider extends ConsumerWidget {
  const SpecialOfferSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeWatch = ref.watch(homeController);
    final images = [
      AppAssets.sliderImg1,
      AppAssets.sliderImg1,
      AppAssets.sliderImg1
    ];
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider(
            carouselController: homeWatch.carouselController,
            items: List.generate(images.length, (i) {
              final img = images[i];
              return Container(
                height: 200.h,
                width: context.screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(img), fit: BoxFit.fill)),
                // child:
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              onPageChanged: (index, reason) {
                homeWatch.setSpecialOfferBanner(index);
              },
              viewportFraction: 1.0,
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return homeWatch.specialOfferImgIndex == index
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
                      homeWatch.setSpecialOfferBanner(index);
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
