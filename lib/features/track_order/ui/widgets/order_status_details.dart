import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/track_order/controller/track_order_controller.dart';

class OrderStatusDetails extends ConsumerWidget {
  const OrderStatusDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trackOrderWatch = ref.watch(trackOrderController);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Status Details',
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ).marginSymmetric(vertical: 17.h),
        ...List.generate(trackOrderWatch.orderStatus.length, (index) {
          final e = trackOrderWatch.orderStatus[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 25.h,
                    width: 25.w,
                    padding: EdgeInsets.all(3.r),
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
                          color: context.colorScheme.primary),
                    ),
                  ),
                  if (!(index == trackOrderWatch.orderStatus.length - 1))
                    CustomPaint(
                      size: const Size(2.0,
                          40.0), // Width and height of the vertical dotted border
                      painter: VerticalDottedBorderPainter(),
                    ).marginVertical(2.h),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.title,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        e.time,
                        style: TextStyle(fontSize: 11.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    e.data,
                    softWrap: true,
                    style: TextStyle(fontSize: 13.sp, color: Colors.black54),
                  )
                ],
              ),
            ],
          );
        })
      ],
    );
  }
}

class VerticalDottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.shade300 // Color of the dotted line
      ..strokeWidth = 2.0 // Width of the dotted line
      ..style = PaintingStyle.stroke;

    const double dashSpacing = 5.0; // Space between each dash
    const double startY = 0.0;
    final double endY = size.height;

    double currentY = startY;
    while (currentY < endY) {
      canvas.drawLine(
        Offset(size.width / 2, currentY),
        Offset(size.width / 2, currentY + dashSpacing),
        paint,
      );
      currentY += dashSpacing * 2; // Adjust the spacing as needed
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
