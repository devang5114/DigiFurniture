import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/notifications/controller/notifications_controller.dart';
import 'package:digifurniture/features/notifications/ui/widgets/notification_card.dart';

import '../../../../common/utils/constants/app_assets.dart';

class NotificationsList extends ConsumerWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationWatch = ref.watch(notificationsController);
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        children: [
          SizedBox(height: 10.h),
          Text(
            'Today',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
          ),
          ...notificationWatch.todayNotifications
              .map((e) => NotificationCard(notificationData: e)),
          SizedBox(height: 20.h),
          Text(
            'Yesterday',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
          ),
          ...notificationWatch.yesterdayNotifications
              .map((e) => NotificationCard(notificationData: e)),
          SizedBox(height: 20.h),
          Text(
            'December 22, 2024',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
          ),
          NotificationCard(
              notificationData: NotificationData(AppAssets.profileFill,
                  'Account Setup Successful!', 'Your account has been created'))
        ],
      ),
    );
  }
}
