import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/on_boarding/ui/widgets/on_boarding_view.dart';

class IntroPageView extends StatelessWidget {
  const IntroPageView({super.key, required this.introData});
  final IntroData introData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 300.h,
          width: context.screenWidth,
          child: Image.asset(
            introData.image,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 50.h),
        Text(
          introData.title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.h),
        Text(
          introData.subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
        ).paddingOnly(left: 20.w, right: 20.w),
      ],
    );
  }
}
