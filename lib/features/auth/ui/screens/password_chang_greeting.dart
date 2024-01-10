import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';

import '../../../../common/config/theme/app_string.dart';

class PasswordChangeGreeting extends ConsumerWidget {
  const PasswordChangeGreeting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 100.h,
              width: 100.w,
              child: Image.asset(AppAssets.passwordVerify),
            ),
            SizedBox(height: 30.h),
            Text(
              appString.keyPasswordChanged,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15.h),
            Text(
              appString.keyPasswordChangedGreetingDesc,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 30.h),
            CommonButton(
                width: 300.w,
                height: 55.h,
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                onTap: () {
                  context.pushAndRemoveUntilNamed(AppRoutes.signIn);
                },
                btnText: appString.keyBackToLogin)
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }
}
