import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/controller/shipping_address_controller.dart';
import 'package:digifurniture/features/profile/controller/address_controller.dart';
import 'package:digifurniture/features/profile/controller/notification_setting_controller.dart';

import '../../../../../common/utils/widgets/common_list_tile.dart';

class NotificationSettingView extends ConsumerWidget {
  const NotificationSettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationWatch = ref.watch(notificationSettingController);
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(notificationWatch.notifications.length, (index) {
            final notification = notificationWatch.notifications[index];
            return SwitchListTile.adaptive(
              value: notification.isEnable,
              inactiveTrackColor: Colors.grey.shade200,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.transparent)),
              inactiveThumbColor: Colors.white,
              title: Text(notification.name),
              onChanged: (value) {
                notificationWatch.toggleSwitch(index, value);
              },
            );
          })
        ],
      ),
    ));
  }
}
