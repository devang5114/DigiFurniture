import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/service/local_db.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/utils/constants/app_const.dart';

final signUpController = ChangeNotifierProvider<SignUpController>((ref) {
  return SignUpController();
});

class SignUpController extends ChangeNotifier {
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  bool termsAndConditions = false;
  bool loading = false;
  bool otpLoading = false;
  String? otp;
  String otpCode = '123456';

  Future<void> signUp(BuildContext context) async {
    if (signUpKey.currentState!.validate()) {
      if (termsAndConditions) {
        loading = true;
        notifyListeners();
        await Future.delayed(3.seconds);
        context.pushNamed(AppRoutes.signUpOtp);
        notifyListeners();
        loading = false;
        notifyListeners();
      } else {
        Fluttertoast.showToast(
            msg: 'Plz Apply terms and condition', gravity: ToastGravity.CENTER);
      }
    }
  }

  verifyOtp(BuildContext context) async {
    if (otp != null && otp == otpCode) {
      otpLoading = true;
      notifyListeners();
      await Future.delayed(3.seconds);
      context.pushNamed(AppRoutes.signUpOtpVerifyGreeting);
      LocalDb.instance.setBool(isLoggedIn, true);
      otpLoading = false;
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: 'Invalid Otp', gravity: ToastGravity.CENTER);
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
