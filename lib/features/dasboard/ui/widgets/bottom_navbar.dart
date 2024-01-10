import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/dasboard/controller/dasboard_controller.dart';

import 'hide_to_scroll_widget.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dasBoardWatch = ref.watch(dasboardController);
    final appString = ref.watch(appStringController);
    return HideToScrollWidget(
      child: Container(
        height: kBottomNavigationBarHeight + 30.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            boxShadow: dasBoardWatch.isBottomNavVisible
                ? [
                    BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 10,
                        blurRadius: 10)
                  ]
                : [],
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r))),
        child: BottomNavigationBar(
            currentIndex: dasBoardWatch.index,
            selectedItemColor: context.colorScheme.primary,
            onTap: (value) {
              dasBoardWatch.setPage(value);
            },
            items: [
              BottomNavigationBarItem(
                  icon: icon(AppAssets.home),
                  activeIcon: icon(AppAssets.homeActive),
                  label: appString.keyHome),
              BottomNavigationBarItem(
                  icon: icon(AppAssets.product),
                  activeIcon: icon(AppAssets.productActive),
                  label: appString.keyProduct),
              BottomNavigationBarItem(
                  icon: icon(AppAssets.cart),
                  activeIcon: icon(AppAssets.cartActive),
                  label: appString.keyCart),
              BottomNavigationBarItem(
                  icon: icon(AppAssets.order),
                  activeIcon: icon(AppAssets.orderActive),
                  label: appString.keyOrder),
              BottomNavigationBarItem(
                  icon: icon(AppAssets.profile),
                  activeIcon: icon(AppAssets.profileActive),
                  label: appString.keyProfile),
            ]),
      ),
    );
  }

  icon(String path) {
    return Image.asset(
      path,
      height: 27.h,
      width: 27.w,
    );
  }
}
