import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/service/local_db.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../common/utils/constants/app_const.dart';

final splashController =
    ChangeNotifierProvider<SplashController>((ref) => SplashController());

class SplashController extends ChangeNotifier {
  init(BuildContext context) async {
    await Future.delayed(3.seconds);
    bool isUserLoggedIn = LocalDb.instance.getBool(isLoggedIn);
    bool isIntroDoneBefore = LocalDb.instance.getBool(isIntroDone);

    if (isUserLoggedIn) {
      context.pushAndReplaceNamed(AppRoutes.dashBoard);
    } else {
      if (isIntroDoneBefore) {
        context.pushAndReplaceNamed(AppRoutes.auth);
      } else {
        context.pushAndReplaceNamed(AppRoutes.onBoarding);
      }
    }
  }
}
