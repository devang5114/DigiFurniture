import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/controller/shipping_address_controller.dart';
import 'package:digifurniture/features/profile/controller/address_controller.dart';
import 'package:digifurniture/features/profile/controller/help_center_controller.dart';
import 'package:digifurniture/features/profile/controller/notification_setting_controller.dart';
import 'package:digifurniture/features/profile/ui/widgets/notifiction_setting/notification_setting_view.dart';

import '../../../../common/config/router/app_routes.dart';
import '../../../../common/utils/widgets/button.dart';
import '../widgets/address/address_view.dart';
import '../widgets/help_center/help_center_view.dart';

class HelpCenter extends ConsumerStatefulWidget {
  const HelpCenter({super.key});

  @override
  ConsumerState<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends ConsumerState<HelpCenter> {
  @override
  void initState() {
    super.initState();
    ref.read(helpCenterController).init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CommonAppBar(
            title: 'Help Center',
          ),
          Expanded(child: HelpCenterView())
        ],
      )),
    );
  }
}

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title('1. Types of Data We Collect'),
          data(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
          SizedBox(height: 10.h),
          title('2. Use of Your Personal Data'),
          data(
              'Magna etiam tempor orci eu lobortis elementum nibh Vulputate enim nulla aliquet porttitor lacus. Orci sagittis ou volutpat odio. Cras semper auctor neque vitae tempus quam pellentesque nec. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Commodo elit at imperdiet dui si vitce suscipit tellus mauns a diam Erat pellentesque odipiscing commodo elit at imperdiet dui. Mi ipsum faucibus vitae aliquet nec ullamcorper. Pellentesque pulvinar pellentesque habitant morbi tristique senectus et'),
          SizedBox(height: 10.h),
          title('3. Disclosure of Your Personal Data'),
          data(
              'Consequat id parta nibh venenatis cras sed ipsum nunc aliquet bibendum enim facilisis gravida neque Nibh tellus molestie nunc non blandit massa. Quam pellentesque nec nam aliquam sem et tortor consequat id Faucibus vitoo aliquet nec ullamcorper sit amet risus. Nunc consequat interdum varius sit amet: Eget magna fermentum iaculis ou non diam phasellus vestibulum Pulvinar pellentesque habitant morbi tristique senectus et Lorem donec massa sapien faucibus et molestie Massa tempor nec feugiat nis! pretium fusce id Lacinia at quis risus sed vulputate odio Integer vitae justo eget magna fermentum iaculs Eget')
        ],
      ),
    );
  }

  title(
    String text,
  ) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
    );
  }

  data(
    String text,
  ) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(fontSize: 15.sp),
    ).marginVertical(10.h);
  }
}
