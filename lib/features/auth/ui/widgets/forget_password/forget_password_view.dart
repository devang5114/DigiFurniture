import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/text_input.dart';
import 'package:digifurniture/features/auth/controller/signUp_controller.dart';
import 'package:digifurniture/features/auth/ui/widgets/sign_in/signIn_form.dart';
import 'package:digifurniture/features/auth/ui/widgets/sign_up/signUp_form.dart';

import '../../../../../common/config/router/app_routes.dart';
import '../../../../../common/utils/helper/validator.dart';
import '../../../controller/forget_password_controller.dart';
import '../../../controller/signIn_controller.dart';

class ForgetPasswordView extends ConsumerWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    final forgetPassWatch = ref.watch(forgetPassController);

    return Form(
      key: forgetPassWatch.forgetPasswordKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250.h,
              width: context.screenWidth,
              child: Image.asset(AppAssets.forgetPassImage),
            ),
            SizedBox(height: 30.h),
            Text(
              appString.keyPasswordRecovery,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5.h),
            Text(
              appString.keyPasswordRecoveryDesc,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 35.h),
            MyTextInput(
              filled: true,
              hintText: appString.keyEmailAddress,
              textInputAction: TextInputAction.next,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              onChange: (val) {
                forgetPassWatch.email = val ?? '';
              },
              validator: emailValidator,
              prefixIcon: IconButton(
                  onPressed: null,
                  icon: Image.asset(
                    AppAssets.emailIcon,
                    fit: BoxFit.cover,
                    height: 28.h,
                    width: 28.w,
                  )),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              customBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.r),
                  borderSide: const BorderSide(color: Colors.white)),
              filledColor: Colors.grey.shade200,
            ),
            SizedBox(height: 150.h),
            CommonButton(
                onTap: () {
                  forgetPassWatch.forgetPassword(context);
                },
                height: 55.h,
                fontWeight: FontWeight.w500,
                fontSize: 17.sp,
                btnText: appString.keyNext),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appString.keyDontHaveAnAccount,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {
                      context.pushAndRemoveUntilNamed(AppRoutes.signUp);
                    },
                    child: const Text('Sign Up'))
              ],
            )
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }
}
