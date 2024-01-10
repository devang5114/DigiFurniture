import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/controller/shipping_address_controller.dart';
import 'package:digifurniture/features/profile/controller/address_controller.dart';
import 'package:digifurniture/features/profile/controller/conact_us_controller.dart';
import 'package:digifurniture/features/profile/controller/notification_setting_controller.dart';

import '../../../../../common/utils/widgets/common_list_tile.dart';

class ContactUsView extends ConsumerWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactUsWatch = ref.watch(contactUsController);
    return Expanded(
        child: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        children: [
          SizedBox(height: 15.h),
          ...List.generate(contactUsWatch.contacts.length, (index) {
            final contact = contactUsWatch.contacts[index];
            return CommonListTile(
                onTap: () {},
                leading: const Icon(Icons.whatshot),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                title: Text(contact),
                subTitle: '',
                trailing: SizedBox());
          })
        ],
      ),
    ));
  }
}
