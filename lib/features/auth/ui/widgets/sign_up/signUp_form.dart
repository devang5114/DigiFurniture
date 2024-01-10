import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/helper/validator.dart';
import 'package:digifurniture/common/utils/widgets/text_input.dart';
import 'package:digifurniture/features/auth/controller/signUp_controller.dart';

import '../../../../../common/config/theme/app_string.dart';
import '../../../controller/signIn_controller.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpWatch = ref.watch(signUpController);
    final appString = ref.watch(appStringController);

    return Form(
      key: ref.read(signUpController).signUpKey,
      child: Column(
        children: [
          SizedBox(height: 40.h),
          MyTextInput(
            filled: true,
            hintText: appString.keyEmailAddress,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            autoValidateMode: AutovalidateMode.onUserInteraction,
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
          SizedBox(height: 10.h),
          MyTextInput(
            filled: true,
            hintText: appString.keyPassword,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            validator: passValidator,
            prefixIcon: IconButton(
                onPressed: null,
                icon: Image.asset(
                  AppAssets.passwordIcon,
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
          SizedBox(height: 10.h),
          Row(
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.r)),
                value: signUpWatch.termsAndConditions,
                onChanged: (value) {
                  signUpWatch.termsAndConditions = value ?? false;
                  signUpWatch.notifyListeners();
                },
              ),
              SizedBox(
                width: 250.w,
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: appString.keyIAgreeWithThe,
                        style: TextStyle(
                            color: Colors.grey, fontSize: 14.sp, height: 2),
                      ),
                      TextSpan(
                        text: appString.keyTermsOfService, // Second word
                        style: TextStyle(
                          color: context.colorScheme
                              .primary, // Brown color for the second word
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                          text: appString.keyPrivacyPolicy,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          )), // Space between words
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
