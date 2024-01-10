import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/payment/controller/view_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/config/router/app_routes.dart';
import '../../../../common/utils/widgets/button.dart';
import '../widgets/view_order_view.dart';

class ViewOrder extends ConsumerStatefulWidget {
  const ViewOrder({super.key});

  @override
  ConsumerState<ViewOrder> createState() => _CheckOutProductState();
}

class _CheckOutProductState extends ConsumerState<ViewOrder> {
  @override
  void initState() {
    super.initState();
    ref.read(viewOrderController).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        CommonAppBar(
          title: 'View Order',
          actionButtons: [
            PopupMenuButton(
              iconSize: 20.h,
              elevation: 0.5,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  side: BorderSide(color: Colors.grey.shade200)),
              icon: IgnorePointer(
                child: SizedBox(
                  child: IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.black,
                      )),
                ),
              ),
              itemBuilder: (context) => [
                popupMenuItem('Share E-Receipt', AppAssets.sendIcon, 0),
                popupMenuItem('Download E-Receipt', AppAssets.downloadIcon, 1),
                popupMenuItem('Print', AppAssets.printIcon, 2),
              ],
            ),
          ],
        ),
        const ViewOrderView()
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
              SizedBox(
                height: 25.h,
                width: 25.w,
                child: Image.asset(iconPath),
              ).marginOnly(right: 10.w),
              Text(name,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
            ],
          ),
          if (index != 2) SizedBox(height: 5.h),
          if (index != 2)
            Divider(
              color: Colors.grey.shade300,
            ).marginSymmetric(horizontal: 10.w),
        ],
      ).marginSymmetric(vertical: 5.h),
    );
  }
}
