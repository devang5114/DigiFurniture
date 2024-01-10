import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/features/auth/ui/widgets/sign_in/signIn_form.dart';

import '../../../controller/signIn_controller.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appString.keyWelcomeBack,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10.h),
        Text(
          appString.keySignInTitle,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
        ),
        const SignInForm(),
        SizedBox(height: 40.h),
        button
      ],
    ).paddingSymmetric(horizontal: 20.w, vertical: 25.h);
  }

  Widget get button => Consumer(
        builder: (context, ref, child) {
          final signInWatch = ref.watch(signInController);
          final appString = ref.watch(appStringController);
          return Column(
            children: [
              CommonButton(
                  height: 55.h,
                  fontWeight: FontWeight.w500,
                  fontSize: 19.sp,
                  onTap: () => signInWatch.signIn(context),
                  btnText: appString.keySignIn),
              SizedBox(height: 5.h),
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
                        context.pushAndReplaceNamed(AppRoutes.signUp);
                      },
                      child: Text(appString.keySignup))
                ],
              )
            ],
          );
        },
      );
}
