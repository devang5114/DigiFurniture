import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/config/theme/app_string.dart';

class Auth extends ConsumerWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.authIntro), fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.white.withOpacity(.8),
                Colors.transparent,
              ])),
            ),
          ),
        ),
        CommonButton(
                backgroundColor: context.colorScheme.primary,
                height: 55.h,
                onTap: () {
                  context.pushNamed(AppRoutes.signIn);
                },
                fontWeight: FontWeight.w600,
                btnText: appString.keySignIn)
            .paddingHorizontal(20.w),
        SizedBox(height: 10.h),
        CommonButton(
                backgroundColor: Colors.transparent,
                border: Border.all(color: context.colorScheme.primary),
                txtColor: context.colorScheme.primary,
                height: 55.h,
                fontWeight: FontWeight.w600,
                onTap: () {
                  context.pushNamed(AppRoutes.signUp);
                },
                btnText: appString.keySignup)
            .paddingHorizontal(20.w)
      ],
    ).paddingOnly(bottom: 10.h));
  }
}
