import 'dart:io';

import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileController = ChangeNotifierProvider<ProfileController>((ref) {
  return ProfileController();
});

class ProfileController extends ChangeNotifier {
  GlobalKey<FormState> profileEditFormKey = GlobalKey<FormState>();
  TextEditingController dobController = TextEditingController();

  File? pickedImg;
  List<Map<String, String>> tilesData = [
    {'title': 'Edit Profile', 'img': AppAssets.profile},
    {'title': 'Address', 'img': AppAssets.locationIcon},
    {'title': 'My Orders', 'img': AppAssets.order},
    {'title': 'Notification', 'img': AppAssets.notificationIcon},
    {'title': 'Privacy Policy', 'img': AppAssets.lockIcon},
    {'title': 'Help Center', 'img': AppAssets.helpCenterIcon},
    {'title': 'Contact Us', 'img': AppAssets.callIcon},
    {'title': 'Logout', 'img': AppAssets.logOutIcon},
  ];

  pickProfileImage() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      pickedImg = File(file.path!);
      notifyListeners();
    }
  }

  pickDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      String date =
          '${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}';
      dobController.text = date;

      notifyListeners();
    }
  }

  @override
  void dispose() {
    dobController.dispose();
    super.dispose();
  }
}
