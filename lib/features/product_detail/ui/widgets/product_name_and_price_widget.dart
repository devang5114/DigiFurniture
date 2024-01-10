import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

class ProductNameAndPrice extends ConsumerWidget {
  const ProductNameAndPrice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Venessa Long Sofa',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w800),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border))
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Text(
                '9,742 sold',
                style: TextStyle(fontSize: 11.r, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(width: 10.w),
            Icon(
              Icons.star_half_rounded,
              color: context.colorScheme.primary,
            ).marginOnly(right: 5.w),
            Text(
              '4.8',
              style: TextStyle(fontSize: 13.r, fontWeight: FontWeight.w500),
            ),
            Text(
              '  (4,749 reviews)',
              style: TextStyle(fontSize: 13.r),
            ),
          ],
        ),
        price
      ],
    );
  }

  Widget get price => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('₹ 4999 ',
              style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w700)),
          Text('₹5999',
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.lineThrough)),
          Text(' (20% off)',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
              ))
        ],
      ).marginOnly(top: 10.h);
}
