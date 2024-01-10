import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/ui/widget/remove_product_bottom_sheet.dart';
import 'package:digifurniture/features/home/ui/widgets/most_popular/most_popular_products.dart';
import 'package:digifurniture/features/payment/controller/view_order_controller.dart';
import 'package:digifurniture/features/track_order/controller/track_order_controller.dart';
import 'package:digifurniture/features/track_order/ui/widgets/cancel_order_bottom_sheet.dart';

import '../../../../common/utils/widgets/button.dart';
import '../../../most_popular_products/ui/widget/most_popular_products.dart';
import '../widgets/track_order_view.dart';

class TrackOrder extends ConsumerStatefulWidget {
  const TrackOrder(this.product, {super.key});
  final ProductData product;
  @override
  ConsumerState<TrackOrder> createState() => _CheckOutProductState();
}

class _CheckOutProductState extends ConsumerState<TrackOrder> {
  @override
  void initState() {
    super.initState();
    ref.read(trackOrderController).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        CommonAppBar(
          title: 'Track Order',
          actionButtons: [
            PopupMenuButton(
              iconSize: 20.h,
              elevation: 0.5,
              color: Colors.white,
              onSelected: (value) {
                print('heyee');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  side: BorderSide(color: Colors.grey.shade200)),
              icon: const SizedBox(
                child: IconButton.outlined(
                    onPressed: null,
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      color: Colors.black,
                    )),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                      showBottomSheet(
                        context: context,
                        builder: (context) => CancelOrderBottomSheet(),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.cancel_presentation_sharp)
                                .marginOnly(right: 10.w),
                            Text('Cancel Order',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  ).marginSymmetric(vertical: 5.h),
                )
              ],
            ),
          ],
        ),
        TrackOrderView(
          product: widget.product,
        )
      ])),
    );
  }

  PopupMenuItem popupMenuItem(String name, String iconPath, int index) {
    return PopupMenuItem(
      value: index,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.cancel_presentation_sharp)
                  .marginOnly(right: 10.w),
              Text(name,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ).marginSymmetric(vertical: 5.h),
    );
  }
}
