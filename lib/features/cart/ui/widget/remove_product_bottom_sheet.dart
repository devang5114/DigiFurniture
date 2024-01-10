import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/cart/controller/cart_controller.dart';

import '../../../../common/utils/widgets/button.dart';
import '../../../home/ui/widgets/most_popular/most_popular_products.dart';
import '../../../most_popular_products/ui/widget/most_popular_products.dart';

class RemoveProductBottomSheet extends ConsumerWidget {
  const RemoveProductBottomSheet(this.product, {super.key});
  final ProductData product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black38, spreadRadius: 100, blurRadius: 100)
      ]),
      child: BottomSheet(
        backgroundColor: Colors.white,
        enableDrag: false,
        dragHandleColor: Colors.grey.shade300,
        onClosing: () {},
        builder: (context) {
          return Container(
            height: 250.h,
            width: context.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 5.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10.r)),
                ),
                Text(
                  'Are you sure you want to remove the product from the cart?',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Expanded(
                        child: CommonButton(
                            border:
                                Border.all(color: context.colorScheme.primary),
                            backgroundColor: Colors.white,
                            onTap: () {
                              context.pop();
                            },
                            txtColor: context.colorScheme.primary,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            btnText: appString.keyCancel)),
                    SizedBox(width: 10.w),
                    Expanded(
                        child: CommonButton(
                            onTap: () {
                              ref.watch(cartController).removeProduct(product);
                              context.pop();
                            },
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            btnText: 'Remove')),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
