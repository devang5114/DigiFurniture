import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/my_order/ui/screens/my_order.dart';
import 'package:digifurniture/features/profile/controller/profile_controller.dart';

import '../../../../../common/utils/widgets/button.dart';

class ProfileNavigationTiles extends ConsumerWidget {
  const ProfileNavigationTiles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return Column(
      children: [
        ...List.generate(profileWatch.tilesData.length, (index) {
          final e = profileWatch.tilesData[index];
          return ListTile(
            enableFeedback: true,
            onTap: () => onTileTap(context, index),
            leading: IconButton(
                onPressed: null,
                icon: Image.asset(
                  e['img']!,
                  height: 27.h,
                  color: e['title'] == 'Logout' ? Colors.red : Colors.black,
                  width: 27.h,
                )),
            title: Text(
              e['title']!,
              style: TextStyle(
                  color: e['title'] == 'Logout' ? Colors.red : Colors.black),
            ),
            trailing: const Icon(Icons.navigate_next_outlined),
          );
        })
      ],
    );
  }

  onTileTap(BuildContext context, int i) {
    switch (i) {
      case 0:
        context.pushNamed(AppRoutes.profileEdit);
        break;
      case 1:
        context.pushNamed(AppRoutes.address);
        break;
      case 2:
        context.push(const MyOrder());
        break;
      case 3:
        context.pushNamed(AppRoutes.notificationSetting);
        break;
      case 4:
        context.pushNamed(AppRoutes.privacyPolicy);
        break;
      case 5:
        context.pushNamed(AppRoutes.helpCenter);
        break;
      case 6:
        context.pushNamed(AppRoutes.contactUs);
        break;
      case 7:
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return BottomSheet(
              backgroundColor: Colors.white,
              elevation: 0,
              enableDrag: false,
              showDragHandle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                side: const BorderSide(color: Colors.grey),
              ),
              onClosing: () {},
              onDragStart: (details) {
                context.pop();
              },
              builder: (context) {
                return Container(
                  width: context.screenWidth,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Are you sure you want to Log out?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 19.sp, fontWeight: FontWeight.w600),
                      ).marginVertical(15.h),
                      Row(
                        children: [
                          Expanded(
                              child: CommonButton(
                                  border: Border.all(
                                      color: context.colorScheme.primary),
                                  backgroundColor: Colors.white,
                                  onTap: () {
                                    context.pop();
                                  },
                                  txtColor: context.colorScheme.primary,
                                  fontSize: 15.sp,
                                  height: 55.h,
                                  fontWeight: FontWeight.w600,
                                  btnText: 'Cancel')),
                          SizedBox(width: 10.w),
                          Expanded(
                              child: CommonButton(
                                  onTap: () {
                                    context.pushAndRemoveUntilNamed(
                                        AppRoutes.auth);
                                  },
                                  height: 55.h,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  btnText: 'Yes, Log Out')),
                        ],
                      ).marginVertical(15.h)
                    ],
                  ),
                );
              },
            );
          },
        );
        break;
    }
  }
}
