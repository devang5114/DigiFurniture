import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/controller/shipping_address_controller.dart';
import 'package:digifurniture/features/profile/controller/address_controller.dart';
import 'package:digifurniture/features/profile/controller/notification_setting_controller.dart';
import 'package:digifurniture/features/profile/ui/widgets/notifiction_setting/notification_setting_view.dart';

import '../../../../common/config/router/app_routes.dart';
import '../../../../common/utils/widgets/button.dart';
import '../widgets/address/address_view.dart';

class NotificationSetting extends ConsumerStatefulWidget {
  const NotificationSetting({super.key});

  @override
  ConsumerState<NotificationSetting> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends ConsumerState<NotificationSetting> {
  @override
  void initState() {
    super.initState();
    ref.read(notificationSettingController).init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CommonAppBar(
            title: 'Notification',
          ),
          NotificationSettingView()
        ],
      )),
    );
  }
}
