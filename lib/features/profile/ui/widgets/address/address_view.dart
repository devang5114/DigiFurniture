import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/profile/controller/address_controller.dart';

import '../../../../../common/utils/widgets/common_list_tile.dart';

class AddressView extends ConsumerWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressWatch = ref.watch(addressController);
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
        child: Column(
          children: [
            ...addressWatch.dummyAddresses.map((e) => CommonListTile(
                onTap: () {
                  addressWatch.selectAddress(e);
                },
                imgPath: AppAssets.locationIcon,
                title: e['title'] == 'Home'
                    ? Row(
                        children: [
                          Text(
                            e['title']!,
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Text(
                              'Default',
                              style: TextStyle(
                                  fontSize: 10.r, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )
                    : Text(
                        e['title']!,
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w600),
                      ),
                subTitle: e['data']!,
                trailing: Container(
                  height: 20.h,
                  width: 20.w,
                  padding: EdgeInsets.all(1.r),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                          color: context.colorScheme.primary, width: 2.w)),
                  child: Container(
                    height: 16.h,
                    width: 16.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: addressWatch.selectedAddress == e
                          ? context.colorScheme.primary
                          : Colors.white,
                    ),
                  ),
                ))),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
