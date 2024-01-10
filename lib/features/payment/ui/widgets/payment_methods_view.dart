import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

import '../../../../common/utils/widgets/common_list_tile.dart';
import '../../controller/payment_method_controller.dart';

class PayMentMethodsView extends ConsumerWidget {
  const PayMentMethodsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentWatch = ref.watch(paymentMethodController);
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
        child: Column(
          children: [
            ...paymentWatch.paymentMethods.map((method) => CommonListTile(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 8),
                onTap: () {
                  paymentWatch.selectPaymentMethod(method);
                },
                imgPath: method.img,
                title: Text(
                  method.name,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ),
                subTitle: '',
                trailing: Container(
                  height: 20.h,
                  width: 20.w,
                  padding: EdgeInsets.all(1.r),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                          color: context.colorScheme.primary, width: 2.w)),
                  child: Container(
                    height: 16.h,
                    width: 16.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: paymentWatch.selectedPaymentMethod == method
                          ? context.colorScheme.primary
                          : Colors.white,
                    ),
                  ),
                ))),
          ],
        ),
      ),
    );
  }
}
