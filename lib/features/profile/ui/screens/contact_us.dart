import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/profile/controller/conact_us_controller.dart';
import 'package:digifurniture/features/profile/ui/widgets/contact_us/contact_us_view.dart';

class ContactUs extends ConsumerStatefulWidget {
  const ContactUs({super.key});

  @override
  ConsumerState<ContactUs> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends ConsumerState<ContactUs> {
  @override
  void initState() {
    super.initState();
    ref.read(contactUsController).init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CommonAppBar(
            title: 'Contact Us',
          ),
          ContactUsView()
        ],
      )),
    );
  }
}
