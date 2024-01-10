import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';

import '../../../../common/config/theme/app_string.dart';

class SignUpOtpVerifyGreeting extends ConsumerWidget {
  const SignUpOtpVerifyGreeting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 300.h,
              width: 300.w,
              child: Image.asset(AppAssets.rocketImage),
            ),
            SizedBox(height: 30.h),
            Text(
              appString.keyWhoohooo,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                  color: context.colorScheme.primary),
            ),
            SizedBox(height: 15.h),
            Text(
              appString.keyYourEmailHasBeenVerifiedSuccessfully,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp, color: context.colorScheme.primary),
            ),
            SizedBox(height: 50.h),
            CommonButton(
                width: 300.w,
                height: 55.h,
                fontWeight: FontWeight.w600,
                fontSize: 17.sp,
                onTap: () {
                  context.pushAndRemoveUntilNamed(AppRoutes.signUpDetail);
                },
                btnText: appString.keyGoToShopping)
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }
}
