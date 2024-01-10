import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_animate/flutter_animate.dart';

class OrderSuccessFullDialog extends StatelessWidget {
  const OrderSuccessFullDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: 5.seconds,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 160.h,
              width: 160.w,
              child: Image.asset(AppAssets.orderSuccessFullImg),
            ).marginOnly(bottom: 25.h),
            Text(
              'Order Successful!',
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
            ).marginOnly(bottom: 5.h),
            Text(
              'You have successfully made order',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp),
            ).marginOnly(bottom: 25.h, top: 10.h),
            CommonButton(
                    txtColor: Colors.white,
                    height: 60.h,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    onTap: () {
                      context.pop();
                      context.pop();
                      context.pop();
                      context.popAndPushNamed(AppRoutes.viewOrder);
                    },
                    btnText: 'View Order')
                .marginOnly(bottom: 10.h),
            CommonButton(
                backgroundColor: Colors.grey.shade300,
                height: 60.h,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                txtColor: context.colorScheme.primary,
                onTap: () {},
                btnText: 'Download E-Receipt'),
          ],
        ),
      ),
    );
  }
}
