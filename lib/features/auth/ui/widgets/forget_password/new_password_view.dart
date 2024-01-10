import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/text_input.dart';
import '../../../../../common/utils/helper/validator.dart';
import '../../../controller/forget_password_controller.dart';

class NewPasswordView extends ConsumerWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    final forgetPassWatch = ref.watch(forgetPassController);

    return Form(
      key: forgetPassWatch.newPasswordKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            SizedBox(
              height: 200.h,
              width: context.screenWidth,
              child: Image.asset(AppAssets.setPassGirl),
            ),
            SizedBox(height: 50.h),
            Text(
              appString.keySetNewPassword,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.h),
            Text(
              appString.keySetNewPasswordDesc,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            SizedBox(height: 35.h),
            MyTextInput(
              filled: true,
              hintText: appString.keyEnterNewPassword,
              textInputAction: TextInputAction.next,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              onChange: (val) {
                forgetPassWatch.password = val ?? '';
                forgetPassWatch.notifyListeners();
              },
              validator: passValidator,
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
            SizedBox(height: 20.h),
            MyTextInput(
              filled: true,
              hintText: appString.keyConfirmPassword,
              textInputAction: TextInputAction.next,
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) =>
                  confirmPassValidator(val, forgetPassWatch.password),
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
            SizedBox(height: 100.h),
            CommonButton(
                onTap: () {
                  forgetPassWatch.changePassword(context);
                },
                height: 55.h,
                fontWeight: FontWeight.w500,
                fontSize: 19.sp,
                btnText: appString.keyChangePassword),
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }
}
