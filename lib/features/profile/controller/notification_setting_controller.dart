import 'dart:io';

import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationSettingController =
    ChangeNotifierProvider<NotificationSettingController>((ref) {
  return NotificationSettingController();
});

class NotificationSettingController extends ChangeNotifier {
  List<NotificationSettingData> notifications = [];

  init() {
    notifications = [
      NotificationSettingData('General Notification'),
      NotificationSettingData('Sound'),
      NotificationSettingData('Vibrate'),
      NotificationSettingData('Special Offers'),
      NotificationSettingData('Promo & Discount'),
      NotificationSettingData('Payments'),
      NotificationSettingData('Cashback'),
      NotificationSettingData('App Updates'),
      NotificationSettingData('New Service Available'),
      NotificationSettingData('New Tips Available'),
    ];
  }

  toggleSwitch(int i, bool val) {
    notifications[i].isEnable = val;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class NotificationSettingData {
  final String name;
  bool isEnable;

  NotificationSettingData(this.name, {this.isEnable = false});
}
