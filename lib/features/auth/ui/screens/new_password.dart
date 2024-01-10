import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/busy_overlay.dart';
import 'package:digifurniture/features/auth/controller/forget_password_controller.dart';

import '../../../../common/config/theme/app_string.dart';
import '../widgets/forget_password/new_password_view.dart';

class NewPassword extends ConsumerWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgetPassWatch = ref.watch(forgetPassController);
    final appString = ref.watch(appStringController);

    return BusyOverlay(
      show: forgetPassWatch.newPasswordLoading,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  IconButton.filledTonal(
                      onPressed: context.pop,
                      style: ButtonStyle(
                          padding: MaterialStateProperty.resolveWith(
                              (states) => EdgeInsets.all(20.r)),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey.shade200)),
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 30.sp,
                      )),
                  Expanded(
                    child: Text(
                      appString.keySetNewPassword,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 15.w),
              const Expanded(child: NewPasswordView()),
            ],
          ),
        ),
      ),
    );
  }
}
