import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

class OfferBannerWidget extends ConsumerWidget {
  const OfferBannerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Image.asset(
          AppAssets.banner1,
        ).marginSymmetric(horizontal: 15.w, vertical: 5.h),
        Image.asset(
          AppAssets.banner2,
        ).marginSymmetric(horizontal: 15.w, vertical: 5.h)
      ],
    );
  }
}
