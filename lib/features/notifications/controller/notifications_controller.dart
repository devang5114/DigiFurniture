import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationsController =
    ChangeNotifierProvider<NotificationsController>((ref) {
  return NotificationsController();
});

class NotificationsController extends ChangeNotifier {
  List<NotificationData> todayNotifications = [
    NotificationData(AppAssets.offerIcon, '30% Special Discount!',
        'Special promotion only valid today'),
  ];
  List<NotificationData> yesterdayNotifications = [
    NotificationData(AppAssets.creditCard2Icon, 'Top Up E-Wallet Successful!',
        'You have to top up your e-wallet'),
    NotificationData(AppAssets.locationIcon, 'New Services Available!',
        'Now you can track orders in real time'),
    NotificationData(AppAssets.creditCardIcon, 'Credit Card Connected!',
        'Credit Card has been linked'),
  ];
}

class NotificationData {
  final String logo;
  final String title;
  final String desc;

  NotificationData(this.logo, this.title, this.desc);
}
