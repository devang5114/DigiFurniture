import 'dart:io';

import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';

final signUpDetailController =
    ChangeNotifierProvider<SignUpDetailController>((ref) {
  return SignUpDetailController();
});

class SignUpDetailController extends ChangeNotifier {
  GlobalKey<FormState> detailKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  TextEditingController birthDateController = TextEditingController();
  bool loading = false;
  File? pickedImg;

  pickDate(BuildContext context) async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      String date =
          '${selectedDate!.day} / ${selectedDate!.month} / ${selectedDate!.year}';
      birthDateController.text = date;

      notifyListeners();
    }
  }

  pickProfileImage() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      pickedImg = File(file.path!);
      notifyListeners();
    }
  }

  saveProfile(BuildContext context) async {
    if (detailKey.currentState!.validate()) {
      if (birthDateController.text.isNotEmpty) {
        loading = true;
        notifyListeners();
        await Future.delayed(3.seconds);
        context.pushAndRemoveUntilNamed(AppRoutes.dashBoard);
        loading = false;
        notifyListeners();
      } else {
        Fluttertoast.showToast(
            msg: 'Please Select Your birthDate', gravity: ToastGravity.CENTER);
      }
    }
  }

  @override
  void dispose() {
    birthDateController.dispose();
    super.dispose();
  }
}
