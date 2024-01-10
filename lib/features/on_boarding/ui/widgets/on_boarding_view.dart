import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/features/on_boarding/controller/on_boarding_controller.dart';
import 'package:digifurniture/features/on_boarding/ui/widgets/intro_page_view.dart';
import 'package:digifurniture/features/on_boarding/ui/widgets/page_indicator.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onBoardingWatch = ref.watch(onBoardingController);
    final appString = ref.watch(appStringController);
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * 0.7,
          child: PageView(
            controller: onBoardingWatch.pageController,
            onPageChanged: (value) {
              onBoardingWatch.onPageChange(value);
            },
            children: [
              IntroPageView(introData: (
                image: AppAssets.intro1,
                title: appString.keyIntro1Title,
                subtitle: appString.keyIntro1Desc
              )),
              IntroPageView(introData: (
                image: AppAssets.intro2,
                title: appString.keyIntro2Title,
                subtitle: appString.keyIntro2Desc
              )),
              IntroPageView(introData: (
                image: AppAssets.intro1,
                title: appString.keyIntro2Title,
                subtitle: appString.keyIntro2Desc
              )),
            ],
          ),
        ),
        const PageIndicator(),
        SizedBox(height: 25.h),
        CommonButton(
            width: 160.w,
            height: 60.h,
            onTap: () {
              onBoardingWatch.nextPage(context);
            },
            btnText: appString.keyNext)
      ],
    );
  }
}

typedef IntroData = ({String image, String title, String subtitle});
