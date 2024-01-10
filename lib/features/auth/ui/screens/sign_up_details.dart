import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/widgets/busy_overlay.dart';
import 'package:digifurniture/features/auth/controller/sign_up_detail_controller.dart';

import '../../../../common/config/theme/app_string.dart';
import '../widgets/sign_up/sign_up_detail_view.dart';

class SignUpDetails extends ConsumerWidget {
  const SignUpDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailWatch = ref.watch(signUpDetailController);
    final appString = ref.watch(appStringController);

    return BusyOverlay(
      show: detailWatch.loading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            appString.keySignup,
            style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: const SignUpDetailsView(),
      ),
    );
  }
}
