import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:syncfusion_flutter_core/src/theme/slider_theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../common/config/theme/app_string.dart';
import '../../controller/search_filter_controller.dart';

class PriceRangeSelector extends ConsumerWidget {
  const PriceRangeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    final searchFiltersWatch = ref.watch(searchFilterController);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15.h),

        Text(
          appString.keyPriceRange,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
        ),
        SfRangeSlider(
          min: 0.0,
          max: 3000.0,
          values: searchFiltersWatch.priceRange,
          tooltipTextFormatterCallback: (actualValue, formattedText) =>
              '₹${actualValue.round()}',
          interval: 20,
          startThumbIcon: Container(
            height: 25.h,
            width: 25.w,
            decoration: BoxDecoration(
                color: context.colorScheme.primary, shape: BoxShape.circle),
            padding: EdgeInsets.all(7.r),
            child: Container(
              height: 15.h,
              width: 15.w,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
          ),
          enableTooltip: true,
          endThumbIcon: Container(
            height: 25.h,
            width: 25.w,
            decoration: BoxDecoration(
                color: context.colorScheme.primary, shape: BoxShape.circle),
            padding: EdgeInsets.all(7.r),
            child: Container(
              height: 15.h,
              width: 15.w,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
          ),
          onChanged: (SfRangeValues values) {
            searchFiltersWatch.changePriceRange(values);
            print(values);
          },
        ),
        // FlutterSlider(
        //   values: [0, 1000],
        //   values: [0, 1000],
        //   rangeSlider: true,
        //   max: 3000,
        //   min: 0,
        //   step: const FlutterSliderStep(step: 1),
        //   jump: true,
        //   trackBar: FlutterSliderTrackBar(
        //     activeTrackBarHeight: 2,
        //     activeTrackBar: BoxDecoration(color: context.colorScheme.primary),
        //   ),
        //   tooltip: FlutterSliderTooltip(
        //     alwaysShowTooltip: true,
        //     boxStyle: FlutterSliderTooltipBox(
        //         decoration: BoxDecoration(
        //             border: Border.all(color: Colors.transparent))),
        //     leftPrefix: Text(
        //       '₹',
        //       style: TextStyle(
        //           fontSize: 12.sp,
        //           color: Colors.black,
        //           fontWeight: FontWeight.w600),
        //     ),
        //     rightPrefix: Text(
        //       '₹',
        //       style: TextStyle(
        //           fontSize: 12.sp,
        //           color: Colors.black,
        //           fontWeight: FontWeight.w600),
        //     ),
        //     positionOffset: FlutterSliderTooltipPositionOffset(top: 55),
        //     textStyle: TextStyle(
        //         fontSize: 12.sp,
        //         color: Colors.black,
        //         fontWeight: FontWeight.w600),
        //   ),
        //   handler: FlutterSliderHandler(
        //     decoration: const BoxDecoration(shape: BoxShape.circle),
        //     child: Container(
        //       height: 25.h,
        //       width: 25.w,
        //       decoration: BoxDecoration(
        //           color: context.colorScheme.primary, shape: BoxShape.circle),
        //       padding: EdgeInsets.all(7.r),
        //       child: Container(
        //         height: 15.h,
        //         width: 15.w,
        //         decoration: const BoxDecoration(
        //             color: Colors.white, shape: BoxShape.circle),
        //       ),
        //     ),
        //   ),
        //   rightHandler: FlutterSliderHandler(
        //     decoration: const BoxDecoration(shape: BoxShape.circle),
        //     child: Container(
        //       height: 25.h,
        //       width: 25.w,
        //       decoration: BoxDecoration(
        //           color: context.colorScheme.primary, shape: BoxShape.circle),
        //       padding: EdgeInsets.all(7.r),
        //       child: Container(
        //         height: 15.h,
        //         width: 15.w,
        //         decoration: const BoxDecoration(
        //             color: Colors.white, shape: BoxShape.circle),
        //       ),
        //     ),
        //   ),
        //   onDragging: (handlerIndex, lowerValue, upperValue) {
        //     // _lowerValue = lowerValue;
        //     // _upperValue = upperValue;
        //     // setState(() {});
        //   },
        // ),
      ],
    ).marginHorizontal(5.w);
  }
}
//
// class CustomTooltipShape extends SfTooltipShape {
//   void paint(PaintingContext context, Offset thumbCenter, Offset offset,
//       TextPainter textPainter,
//       {required RenderBox parentBox,
//       required SfSliderThemeData sliderThemeData,
//       required Paint paint,
//       required Animation<double> animation,
//       required Rect trackRect}) {
//     final Canvas canvas = context.canvas;
//
//     // Define the size and shape of the thumb
//     // final double thumbRadius = 15.0;
//     // final Rect thumbRect =
//     //     Rect.fromCircle(center: thumbCenter, radius: thumbRadius);
//
//     // Customize thumb paint properties
//     paint.color = sliderThemeData.thumbColor!;
//     paint.style = PaintingStyle.fill;
//
//     // Draw the thumb
//     // canvas.drawCircle(thumbCenter, thumbRadius, paint);
//
//     // Draw text on the thumb (if needed)
//     // if (sliderThemeData.showTooltip) {
//     final double textWidth = textPainter.width;
//     final double textHeight = textPainter.height;
//     final Offset textOffset = Offset(
//         thumbCenter.dx - textWidth / 2, thumbCenter.dy - textHeight / 200);
//     final Rect tooltipRect = Rect.fromPoints(
//         textOffset.translate(10,
//             10), // Adjust these values to position the tooltip relative to the thumb
//         textOffset.translate(
//             textWidth + -10,
//             textHeight +
//                 -10)); // Adjust these values for tooltip size and padding
//     // );
//
//     final RRect tooltipRRect =
//         RRect.fromRectAndRadius(tooltipRect, Radius.circular(4.0));
//
//     paint.color = Colors.transparent;
//     canvas.drawRRect(tooltipRRect, paint);
//
//     // Paint the text on the tooltip
//     textPainter.paint(canvas, textOffset);
//   }
// }

class CustomTooltip extends StatelessWidget {
  final double value;
  final double position;

  CustomTooltip({required this.value, required this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position * 3.0, // Adjust the factor for proper positioning
      child: Container(
        margin: EdgeInsets.only(top: 10.0), // Adjust the margin as needed
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.blue, // Customize the tooltip background color
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          value.toStringAsFixed(1), // Format the value as needed
          style: TextStyle(
            color: Colors.white, // Customize the text color
          ),
        ),
      ),
    );
  }
}
