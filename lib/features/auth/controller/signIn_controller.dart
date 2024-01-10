import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../common/utils/constants/app_const.dart';
import '../../../common/utils/service/local_db.dart';

final signInController = ChangeNotifierProvider<SignInController>((ref) {
  return SignInController();
});

class SignInController extends ChangeNotifier {
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  bool rememberMe = false;
  bool loading = false;

  Future<void> signIn(BuildContext context) async {
    if (signInKey.currentState!.validate()) {
      loading = true;
      notifyListeners();
      await Future.delayed(3.seconds);
      await LocalDb.instance.setBool(isLoggedIn, true);
      context.pushAndRemoveUntilNamed(AppRoutes.dashBoard);

      notifyListeners();
      loading = false;
      notifyListeners();
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
