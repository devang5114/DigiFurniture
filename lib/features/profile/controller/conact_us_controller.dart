import 'dart:io';

import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactUsController = ChangeNotifierProvider<ContactUsController>((ref) {
  return ContactUsController();
});

class ContactUsController extends ChangeNotifier {
  List<String> contacts = [];

  init() {
    contacts = [
      'Customer Service',
      'WhatsApp',
      'Website',
      'Facebook',
      'Twitter',
      'Instagram',
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
