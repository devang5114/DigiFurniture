import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/features/auth/controller/signUp_controller.dart';
import 'package:digifurniture/features/auth/ui/widgets/sign_in/signIn_form.dart';
import 'package:digifurniture/features/auth/ui/widgets/sign_up/signUp_form.dart';

import '../../../../../common/config/router/app_routes.dart';
import '../../../controller/signIn_controller.dart';

class SignUpView extends ConsumerWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appString.keySignUpTitle,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10.h),
        Text(
          appString.keySignUpDesc,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
        const SignUpForm(),
        SizedBox(height: 40.h),
        button
      ],
    ).paddingSymmetric(horizontal: 20.w, vertical: 25.h);
  }

  Widget get button => Consumer(
        builder: (context, ref, child) {
          final sinUpWatch = ref.watch(signUpController);
          final appString = ref.watch(appStringController);
          return Column(
            children: [
              CommonButton(
                  height: 55.h,
                  onTap: () => sinUpWatch.signUp(context),
                  btnText: appString.keySignup),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appString.keyDoYouHaveAnyAccount,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {
                        context.pushAndReplaceNamed(AppRoutes.signIn);
                      },
                      child: Text(appString.keySignIn))
                ],
              )
            ],
          );
        },
      );
}
