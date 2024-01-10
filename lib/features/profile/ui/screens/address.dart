import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/profile/controller/address_controller.dart';

import '../../../../common/config/router/app_routes.dart';
import '../../../../common/utils/widgets/button.dart';
import '../widgets/address/address_view.dart';

class Address extends ConsumerStatefulWidget {
  const Address({super.key});

  @override
  ConsumerState<Address> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends ConsumerState<Address> {
  @override
  void initState() {
    super.initState();
    ref.read(addressController).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: Column(
        children: [
          CommonAppBar(
            title: 'Address',
          ),
          AddressView()
        ],
      )),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: CommonButton(
          onTap: () => context.pushNamed(AppRoutes.addNewAddress),
          btnText: 'Add New Address',
          fontSize: 15.sp,
          height: 55.h,
          fontWeight: FontWeight.w600,
          padding: EdgeInsets.symmetric(
            horizontal: 40.w,
          ),
        ),
      ),
    );
  }
}
