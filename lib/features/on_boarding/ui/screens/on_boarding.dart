import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/on_boarding/controller/on_boarding_controller.dart';

import '../../../../common/utils/constants/app_const.dart';
import '../../../../common/utils/service/local_db.dart';
import '../widgets/on_boarding_view.dart';

class OnBoarding extends ConsumerWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    final onBoardingWatch = ref.watch(onBoardingController);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            TextButton(
                onPressed: () {
                  context.pushAndReplaceNamed(AppRoutes.auth);
                  LocalDb.instance.setBool(isIntroDone, true);
                },
                child: Text(
                  appString.keySkip,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ))
          ],
        ),
        extendBodyBehindAppBar: true,
        body: const OnboardingView(),
      ),
    );
  }
}
