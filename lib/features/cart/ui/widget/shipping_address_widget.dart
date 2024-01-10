import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/cart/ui/widget/shipping_address_view.dart';

import '../../../../common/utils/widgets/common_list_tile.dart';

class ShippingAddressWidget extends ConsumerWidget {
  const ShippingAddressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping Address',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ).marginOnly(bottom: 17.h),
        CommonListTile(
            imgPath: AppAssets.locationIcon,
            title: Text(
              'Home',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            subTitle: '61480 Sunbrook Park, PC 5679',
            trailing: IconButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.shippingAddress);
                },
                icon: const Icon(Icons.edit_rounded))),
      ],
    ).marginSymmetric(vertical: 20.h);
  }
}
