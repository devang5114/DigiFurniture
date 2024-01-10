import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/cart/controller/cart_controller.dart';

import '../../../../common/utils/widgets/button.dart';
import '../../../home/ui/widgets/most_popular/most_popular_products.dart';

class CancelOrderBottomSheet extends ConsumerWidget {
  const CancelOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    return BottomSheet(
      backgroundColor: Colors.white,
      enableDrag: false,
      dragHandleColor: Colors.grey.shade300,
      onClosing: () {},
      builder: (context) {
        return Container(
          width: context.screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.r)),
              ).marginSymmetric(vertical: 15.h),
              Text(
                'Are you sure you want to cancel this order?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
              ).marginVertical(20.h),
              CommonButton(
                      backgroundColor: context.colorScheme.primary,
                      onTap: () {
                        context.pop();
                      },
                      txtColor: Colors.white,
                      fontSize: 16.sp,
                      height: 55.h,
                      fontWeight: FontWeight.w600,
                      btnText: 'Order Cancel')
                  .marginVertical(20.h)
            ],
          ),
        );
      },
    );
  }
}
