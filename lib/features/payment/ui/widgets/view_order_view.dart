import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/payment/ui/widgets/view_order_products.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ViewOrderView extends StatelessWidget {
  const ViewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 18.w,
        ),
        child: Column(
          children: [
            const ViewOrderProducts().marginOnly(bottom: 15.h),
            table(productsPriceData, context, isTotalContain: true),
            SizedBox(height: 15.h),
            table(paymentDetails, context),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }

  table(List<Map<String, String>> data, BuildContext context,
      {bool isTotalContain = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        children: [
          Table(
            children: data.map((e) {
              final title = e['title']!;
              final data = e['data']!;
              return TableRow(children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                ).paddingSymmetric(vertical: 10),
                if (title == 'Transaction ID')
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          data,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                        ).marginOnly(right: 5.w),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: data));
                            Fluttertoast.showToast(
                                msg: 'Copy to clip board',
                                backgroundColor:
                                    context.colorScheme.onBackground,
                                textColor: context.colorScheme.background);
                          },
                          child: Image.asset(
                            AppAssets.copyIcon,
                            height: 20.h,
                            width: 20.w,
                          ),
                        )
                      ],
                    ),
                  )
                else if (title == 'Status')
                  Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: context.colorScheme.primary,
                        ),
                        child: Text(
                          data,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ))
                else
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      data,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ).paddingSymmetric(vertical: 10, horizontal: 10.w),
              ]);
            }).toList(),
          ),
          if (isTotalContain)
            Divider(
              color: Colors.grey.shade200,
            ),
          if (isTotalContain)
            Row(children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 13.sp, color: Colors.grey),
              ).paddingSymmetric(vertical: 10),
              const Spacer(),
              Text(
                '₹ 2,130',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ).paddingSymmetric(vertical: 10, horizontal: 10.w),
            ])
        ],
      ),
    );
  }
}

final productsPriceData = [
  {'title': 'Amount', 'data': '₹ 1,970'},
  {'title': 'Shipping', 'data': '₹ 1,970'},
  {'title': 'Coupon discount', 'data': '₹ -100'},
  {'title': 'GST 28%', 'data': '₹ -1200'},
];

final paymentDetails = [
  {'title': 'Payment Methods', 'data': 'Razorpay'},
  {'title': 'Date', 'data': 'Dec 15, 2024 \n10:00:27 AM'},
  {'title': 'Transaction ID', 'data': 'SK7263727399'},
  {'title': 'Status', 'data': 'Paid'},
];
