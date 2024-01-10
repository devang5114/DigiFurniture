import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final forgetPassController =
    ChangeNotifierProvider<ForgetPasswordController>((ref) {
  return ForgetPasswordController();
});

class ForgetPasswordController extends ChangeNotifier {
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();
  GlobalKey<FormState> newPasswordKey = GlobalKey<FormState>();

  bool loading = false;
  bool otpLoading = false;
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool newPasswordLoading = false;
  String? otp;
  String? otpCode = '123456';

  Future<void> forgetPassword(BuildContext context) async {
    if (forgetPasswordKey.currentState!.validate()) {
      loading = true;
      notifyListeners();
      await Future.delayed(3.seconds);
      context.pushNamed(AppRoutes.forgetPasswordOtp);
      loading = false;
      notifyListeners();
    }
  }

  verifyOtp(BuildContext context) async {
    if (otp != null && otp == otpCode) {
      otpLoading = true;
      notifyListeners();
      await Future.delayed(3.seconds);
      context.pushNamed(AppRoutes.newPassword);
      otpLoading = false;
      notifyListeners();
    } else {
      Fluttertoast.showToast(msg: 'Invalid Otp', gravity: ToastGravity.CENTER);
    }
  }

  changePassword(BuildContext context) async {
    if (newPasswordKey.currentState!.validate()) {
      newPasswordLoading = true;
      notifyListeners();
      await Future.delayed(3.seconds);
      context.pushAndRemoveUntilNamed(AppRoutes.passwordChangedGreeting);
      newPasswordLoading = false;
      notifyListeners();
    }
  }

  resendOtp() async {}

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
