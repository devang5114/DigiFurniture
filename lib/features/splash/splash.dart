import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});

  @override
  ConsumerState<Splash> createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  @override
  void initState() {
    super.initState();
    ref.read(splashController).init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppAssets.splashImage,
              height: 150,
              width: 150,
            ),
            Positioned(
                bottom: -170.h,
                left: 0,
                right: 0,
                child: Container(
                  height: context.screenHeight * 0.4,
                  width: context.screenWidth,
                  decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      shape: BoxShape.circle),
                ))
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     const Spacer(),
      //     Image.asset(
      //       AppAssets.splashImage,
      //       height: 150,
      //       width: 150,
      //     ),
      //     const Spacer(),
      //     Container(
      //       height: 150.h,
      //       width: context.screenWidth,
      //       decoration: BoxDecoration(
      //           color: context.colorScheme.secondary,
      //           borderRadius:
      //               BorderRadius.vertical(top: Radius.circular(700.r))),
      //     )
      //   ],
      // ),
    );
  }
}
