import 'dart:math';

import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/text_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/features/auth/controller/sign_up_detail_controller.dart';
import 'package:path/path.dart';

import '../../../../common/config/theme/app_string.dart';
import '../../../../common/utils/constants/app_const.dart';
import '../../../../common/utils/service/local_db.dart';
import 'furniture_categorys_widget.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileDetail = ref.watch(signUpDetailController);

    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.white,
                      backgroundImage: profileDetail.pickedImg != null
                          ? FileImage(profileDetail.pickedImg!)
                          : null,
                      foregroundImage: profileDetail.pickedImg == null
                          ? const NetworkImage(
                              'https://image.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg')
                          : null,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello There 👋',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 7.h),
                        Text(
                          'User007@gmail.com',
                          style:
                              TextStyle(fontSize: 13.sp, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                )),
            const DrawerBody()
          ],
        ),
      ),
    );
  }
}

class DrawerBody extends ConsumerWidget {
  const DrawerBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    final sofas = [
      AppAssets.slipperImage,
      AppAssets.clubImage,
      AppAssets.bergereimg,
      AppAssets.tubImage,
    ];
    return Column(
      children: [
        ExpansionTile(
            leading: Image.asset(
              AppAssets.sofaIcon,
              height: 28.h,
              width: 28.w,
            ),
            title: Text(appString.keySofa),
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.r)),
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: sofas.map((e) => sofa(e, context)).toList(),
                ),
              )
            ]),
        ExpansionTile(
            leading: Image.asset(
              AppAssets.chairIcon,
              height: 28.h,
              width: 28.w,
            ),
            title: Text(appString.keyChair),
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10.r)),
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: sofas.map((e) => sofa(e, context)).toList(),
                ),
              )
            ]),
        ListTile(
          onTap: () {},
          leading: Image.asset(
            AppAssets.popularIcon,
            height: 28.h,
          ),
          title: Text(appString.keyMostPopular),
        ),
        ListTile(
          onTap: () {},
          leading: Image.asset(
            AppAssets.offerIcon,
            height: 28.h,
            color: Colors.black,
          ),
          title: Text(appString.keySpecialOffers),
        ),
        ListTile(
          onTap: () {},
          leading: Image.asset(
            AppAssets.privacyIcon,
            height: 28.h,
          ),
          title: Text(appString.keyPrivacyPolicy),
        ),
        ListTile(
          onTap: () {},
          leading: Image.asset(
            AppAssets.shareIcon,
            height: 28.h,
          ),
          title: Text(appString.keyShareApp),
        ),
        ListTile(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.rotate(
                      angle: pi / 2,
                      child: Text(
                        ":(",
                        style: TextStyle(fontSize: 30.sp),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      appString.keyConfirmToLogOut,
                      style: TextStyle(fontSize: 17.sp),
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: context.pop,
                      child: Text(
                        appString.keyCancel,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  SizedBox(height: 10.h),
                  CommonButton(
                    onTap: () {
                      context.pushAndRemoveUntilNamed(AppRoutes.auth);
                      ref.read(signUpDetailController).pickedImg = null;
                      LocalDb.instance.setBool(isLoggedIn, false);
                    },
                    btnText: appString.keyConfirm,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    width: 100.w,
                  ),
                ],
              ),
            );
          },
          leading: Image.asset(
            AppAssets.logoutIcon,
            height: 28.h,
          ),
          title: Text(
            appString.keyLogout,
          ),
        ),
      ],
    );
  }
}

Widget sofa(String path, BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      GestureDetector(
        onTap: () {
          context.push(Demo(basenameWithoutExtension(path).firstCapital));
        },
        child: SizedBox(
          height: 60.h,
          width: 60.w,
          child: Image.asset(path),
        ),
      ),
      SizedBox(height: 8.h),
      Text(
        basenameWithoutExtension(path).firstCapital,
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
      )
    ],
  );
}
