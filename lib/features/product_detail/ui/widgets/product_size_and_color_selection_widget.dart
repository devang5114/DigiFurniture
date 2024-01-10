import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/product_detail/controller/product_detail_controller.dart';

class ProductSizeAndColorSelectionWidget extends ConsumerWidget {
  const ProductSizeAndColorSelectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productDetailWatch = ref.watch(productDetailController);
    return Column(
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Size",
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ).marginOnly(bottom: 10.h),
                SizedBox(
                  height: 45.h,
                  child: DropdownButtonFormField(
                      alignment: Alignment.center,
                      decoration: InputDecoration(
                        constraints: BoxConstraints(
                            maxWidth: context.screenWidth * 0.45,
                            minWidth: context.screenWidth * 0.35),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 8.h),
                        fillColor: Colors.white,
                        hintText: "Choose your Kg",
                        hintStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5.w)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5.w)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5.w)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5.w)),
                        helperStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                        // suffixIcon: const Icon(Icons.arrow_drop_down),
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Single',
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.w500),
                          ),
                          value: 'single',
                          enabled: true,
                        ),
                        DropdownMenuItem(
                          child: Text('Medium Size',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500)),
                          value: 'medium',
                        ),
                        DropdownMenuItem(
                          child: Text('Long Size',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500)),
                          value: 'long',
                        ),
                      ],
                      onChanged: (val) {}),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Color",
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
                ).marginOnly(bottom: 13.h),
                Row(
                    children: List.generate(
                        5,
                        (index) => GestureDetector(
                              onTap: () {
                                productDetailWatch.selectedColorIndex = index;
                                productDetailWatch.notifyListeners();
                              },
                              child: CircleAvatar(
                                maxRadius: 15.r,
                                minRadius: 13.r,
                                backgroundColor: [
                                  Colors.brown,
                                  Colors.blueGrey,
                                  Colors.deepPurpleAccent,
                                  Colors.green,
                                  Colors.purple
                                ][index],
                                child: productDetailWatch.selectedColorIndex ==
                                        index
                                    ? Icon(
                                        Icons.check,
                                        size: 18.sp,
                                      )
                                    : null,
                              ).marginOnly(right: index == 4 ? 2.w : 4.w),
                            )).toList())
              ],
            ),
          )
        ]).marginOnly(left: 10.w, right: 5.w, bottom: 13.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Quantity",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
            ),
            Container(
              height: 43.h,
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10.r),
                  border:
                      Border.all(color: Colors.grey.shade400, width: 1.5.w)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r))),
                        onPressed: () {
                          if (productDetailWatch.quantity != 0) {
                            productDetailWatch.quantity--;
                            productDetailWatch.notifyListeners();
                          }
                        },
                        icon: Text(
                          "-",
                          style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                    SizedBox(width: 10.w),
                    Text(
                      "${productDetailWatch.quantity}",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(width: 10.w),
                    IconButton(
                        style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r))),
                        onPressed: () {
                          productDetailWatch.quantity++;
                          productDetailWatch.notifyListeners();
                        },
                        icon: Text(
                          "+",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
