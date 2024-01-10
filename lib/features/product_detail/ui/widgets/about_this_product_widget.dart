import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

class AboutThisProductWidget extends StatelessWidget {
  const AboutThisProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About this product',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 13.h),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
          children: [
            TableRow(children: [
              Text(
                'Product Dimensions',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ).marginOnly(bottom: 15.h),
              Text(
                '77D X 141W X 79H Cm',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ).marginOnly(bottom: 15.h),
            ]),
            TableRow(children: [
              Text(
                'Colour',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ).marginOnly(bottom: 15.h),
              Text(
                'Grey',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ).marginOnly(bottom: 15.h),
            ]),
            TableRow(children: [
              Text(
                'Brand',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ).marginOnly(bottom: 15.h),
              Text(
                'Solimo',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ).marginOnly(bottom: 15.h),
            ]),
            TableRow(children: [
              Text(
                'Style',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ).marginOnly(bottom: 15.h),
              Text(
                'LHS',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ).marginOnly(bottom: 15.h),
            ]),
            TableRow(children: [
              Text(
                'Special Feature',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ).marginOnly(bottom: 15.h),
              Text(
                'Space Saving',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ).marginOnly(bottom: 15.h),
            ]),
            TableRow(children: [
              Text(
                'Туре',
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ).marginOnly(bottom: 15.h),
              Text(
                'Standard',
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ).marginOnly(bottom: 15.h),
            ]),
          ],
        )
      ],
    );
  }
}
