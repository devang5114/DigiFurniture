import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/text_input.dart';

class PromoCodeAndTotalPrice extends ConsumerWidget {
  const PromoCodeAndTotalPrice({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Promo Code',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ).marginOnly(bottom: 15.h),
        MyTextInput(
          filled: true,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 19.h),
          hintText: 'Promo Code',
          filledColor: Colors.grey.shade100,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.cancel, color: Colors.grey)),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Apply',
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                  )).marginOnly(right: 10.w),
            ],
          ),
          customBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: Colors.transparent)),
        ),
        SizedBox(height: 20.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: Colors.grey.shade200)),
          child: Column(
            children: [
              Table(
                children: productsPriceData.map((e) {
                  final title = e['title']!;
                  final data = e['data']!;
                  return TableRow(children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                    ).paddingSymmetric(vertical: 10),
                    Align(
                      child: Text(
                        data,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      alignment: Alignment.centerRight,
                    ).paddingSymmetric(vertical: 10, horizontal: 10.w),
                  ]);
                }).toList(),
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              Row(children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                ).paddingSymmetric(vertical: 10),
                Spacer(),
                Text(
                  '₹ 2,130',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                ).paddingSymmetric(vertical: 10, horizontal: 10.w),
              ])
            ],
          ),
        ),
      ],
    ).marginSymmetric(vertical: 15.h);
  }
}

final productsPriceData = [
  {'title': 'Amount', 'data': '₹ 1,970'},
  {'title': 'Shipping', 'data': '₹ 1,970'},
  {'title': 'Coupon discount', 'data': '₹ -100'},
  {'title': 'GST 28%', 'data': '₹ -1200'},
];
