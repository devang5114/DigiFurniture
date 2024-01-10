import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

class ProductDetailText extends StatelessWidget {
  const ProductDetailText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 20.h),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '•',
          style: TextStyle(fontSize: 19.sp),
        ),
        SizedBox(
          width: context.screenWidth * 0.8,
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor incididunt ut labore et dolore magna',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ).marginOnly(left: 10.h)
      ]),
      SizedBox(height: 10.h),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '•',
          style: TextStyle(fontSize: 19.sp),
        ),
        SizedBox(
          width: context.screenWidth * 0.8,
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor incididunt ut labore et dolore magna',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ).marginOnly(left: 10.h)
      ]),
      SizedBox(height: 10.h),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '•',
          style: TextStyle(fontSize: 19.sp),
        ),
        SizedBox(
          width: context.screenWidth * 0.8,
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor incididunt ut labore et dolore magna',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ).marginOnly(left: 10.h)
      ]),
      SizedBox(height: 10.h),
      TextButton.icon(
          onPressed: () {},
          icon: Text('See more'),
          label: Icon(Icons.keyboard_arrow_down_rounded))
    ]);
  }
}
