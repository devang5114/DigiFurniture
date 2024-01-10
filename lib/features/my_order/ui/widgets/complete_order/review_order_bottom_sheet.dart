import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/text_input.dart';
import 'package:digifurniture/features/my_order/ui/widgets/complete_order/completed_order_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../most_popular_products/ui/widget/most_popular_products.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewOrderBottomSheet extends ConsumerWidget {
  const ReviewOrderBottomSheet(this.product, {super.key});
  final ProductData product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    return Ink(
      child: BottomSheet(
        backgroundColor: Colors.white,
        elevation: 0,
        enableDrag: false,
        showDragHandle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          side: const BorderSide(color: Colors.grey),
        ),
        onClosing: () {},
        onDragStart: (details) {
          context.pop();
        },
        builder: (context) {
          return Container(
            width: context.screenWidth,
            // decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //           color: Colors.black26, spreadRadius: 200, blurRadius: 100)
            //     ]),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Leave a Review',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w700),
                  ).marginOnly(bottom: 15.h),
                  Divider(
                    color: Colors.grey.shade200,
                  ).marginSymmetric(horizontal: 10.w),
                  CompleteOrderCard(
                    product,
                    isFromReviewSheet: true,
                  ).marginOnly(bottom: 15.h),
                  Divider(
                    color: Colors.grey.shade200,
                  ).marginSymmetric(horizontal: 10.w),
                  Text(
                    'How is your Order?',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w800),
                  ).marginOnly(bottom: 10.h),
                  Text(
                    'Please give your rating & also your review',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star_rounded,
                      color: context.colorScheme.primary,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ).marginSymmetric(vertical: 10.h),
                  MyTextInput(
                    hintText: 'Review',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppAssets.gallaryIcon,
                        height: 25.h,
                        color: const Color(0xFFffccac),
                        width: 25.w,
                      ),
                    ),
                    // suffixIcon: SizedBox(
                    //   height: 25.h,
                    //   width: 25.w,
                    //   child: FittedBox(
                    //     child: Image.asset(
                    //       AppAssets.gallaryIcon,
                    //       height: 25.h,
                    //       width: 25.w,
                    //     ),
                    //   ),
                    // ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
                    customBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide: const BorderSide(color: Color(0xFFffccac))),
                  ).marginSymmetric(vertical: 10.h),
                  Divider(
                    color: Colors.grey.shade200,
                  ).marginSymmetric(horizontal: 10.w),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  side: BorderSide(
                                      color: context.colorScheme.primary)),
                              backgroundColor: Colors.white),
                          onPressed: context.pop,
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: context.colorScheme.primary,
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 18.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r)),
                              backgroundColor: context.colorScheme.primary),
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: 'Review Submitted',
                                gravity: ToastGravity.CENTER,
                                backgroundColor: context.colorScheme.primary,
                                textColor: Colors.white);
                            context.pop();
                          },
                          child: Text(
                            "Submit!",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  ).marginOnly(bottom: 10.h)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
