import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/text_input.dart';
import 'package:digifurniture/features/auth/controller/signUp_controller.dart';
import 'package:pinput/pinput.dart';
import '../../../../../common/config/router/app_routes.dart';
import '../../../../../common/utils/helper/validator.dart';
import '../../../controller/forget_password_controller.dart';
import '../../../controller/signIn_controller.dart';

class SignUpOtpView extends ConsumerWidget {
  const SignUpOtpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    final signUpWatch = ref.watch(signUpController);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200.h,
            width: context.screenWidth,
            child: Image.asset(AppAssets.otpGirl),
          ),
          SizedBox(height: 30.h),
          Text(
            appString.keyVerificationCode,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5.h),
          Text(
            appString.keyVerificationCodeSentDesc,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
          SizedBox(height: 35.h),
          Row(
            children: [
              Text(
                'te****@gmail.com',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              TextButton(
                  onPressed: () {}, child: const Text('Change your email?')),
            ],
          ),
          SizedBox(height: 35.h),
          Pinput(
            length: 6,
            onCompleted: (value) {
              signUpWatch.otp = value;
              signUpWatch.notifyListeners();
            },
          ),
          SizedBox(height: 130.h),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                    backgroundColor: Colors.white,
                    border: Border.all(color: context.colorScheme.primary),
                    onTap: () {},
                    txtColor: context.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    btnText: appString.keyResend),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: CommonButton(
                    onTap: () {
                      signUpWatch.verifyOtp(context);
                    },
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    btnText: appString.keyConfirm),
              ),
            ],
          )
        ],
      ).paddingAll(20.w),
    );
  }
}
