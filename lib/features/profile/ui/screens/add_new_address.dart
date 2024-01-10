import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';

import '../../../../common/utils/constants/app_assets.dart';
import '../../../../common/utils/widgets/button.dart';
import '../widgets/address/add_new_addres_view.dart';
import '../widgets/profile_edit/profile_edit_view.dart';

class AddNewAddress extends ConsumerStatefulWidget {
  const AddNewAddress({super.key});

  @override
  ConsumerState<AddNewAddress> createState() => _ProfileEditState();
}

class _ProfileEditState extends ConsumerState<AddNewAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: Column(
        children: [
          CommonAppBar(
            title: 'Add New Address',
          ),
          Expanded(child: AddNewAddressView())
        ],
      )),
      bottomNavigationBar: Container(
        // color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Row(
          children: [
            Expanded(
              child: CommonButton(
                onTap: context.pop,
                backgroundColor: Colors.white,
                border: Border.all(color: context.colorScheme.primary),
                btnText: 'Cancel',
                txtColor: context.colorScheme.primary,
                fontSize: 15.sp,
                height: 55.h,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 7.w),
            Expanded(
              child: CommonButton(
                backgroundColor: context.colorScheme.primary,
                onTap: context.pop,
                btnText: 'Continue',
                fontSize: 15.sp,
                height: 55.h,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
