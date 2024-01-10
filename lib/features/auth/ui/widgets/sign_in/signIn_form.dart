import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/helper/validator.dart';
import 'package:digifurniture/common/utils/widgets/text_input.dart';

import '../../../../../common/config/theme/app_string.dart';
import '../../../controller/signIn_controller.dart';

class SignInForm extends ConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInWatch = ref.watch(signInController);
    final appString = ref.watch(appStringController);

    return Form(
      key: ref.read(signInController).signInKey,
      child: Column(
        children: [
          SizedBox(height: 40.h),
          MyTextInput(
            filled: true,
            hintText: appString.keyEmailAddress,
            textInputAction: TextInputAction.next,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
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
            validator: passValidator,
            autoValidateMode: AutovalidateMode.onUserInteraction,
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
                value: signInWatch.rememberMe,
                onChanged: (value) {
                  signInWatch.rememberMe = value ?? false;
                  signInWatch.notifyListeners();
                },
              ),
              Text(
                appString.keyRememberMe,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.forgetPassword);
                  },
                  child: Text(
                    appString.keyForgetPassword,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
