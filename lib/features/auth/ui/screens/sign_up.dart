import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/busy_overlay.dart';
import 'package:digifurniture/features/auth/controller/signUp_controller.dart';
import 'package:digifurniture/features/auth/ui/widgets/sign_up/sign_up_view.dart';

import '../../controller/signIn_controller.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpWatch = ref.watch(signUpController);

    return BusyOverlay(
      show: signUpWatch.loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 300.h,
                width: context.screenWidth,
                child: Image.asset(
                  AppAssets.signUpImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SignUpView()
            ],
          ),
        ),
      ),
    );
  }
}
