import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/busy_overlay.dart';

import '../../controller/signIn_controller.dart';
import '../widgets/sign_in/sign_in_view.dart';

class SignIn extends ConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInWatch = ref.watch(signInController);

    return BusyOverlay(
      show: signInWatch.loading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 300.h,
                width: context.screenWidth,
                child: Image.asset(
                  AppAssets.signInImage,
                  fit: BoxFit.cover,
                ),
              ),
              const SignInView()
            ],
          ),
        ),
      ),
    );
  }
}
