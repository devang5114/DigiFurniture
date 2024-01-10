import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

import 'order_status_details.dart';

class TrackerWidget extends ConsumerWidget {
  const TrackerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const ProductTracker(completedStepIndex: 2),
        Text(
          'Packet In Delivery',
          style: TextStyle(fontSize: 15.h, fontWeight: FontWeight.w600),
        ).marginSymmetric(vertical: 30.h),
      ],
    ).marginOnly(top: 30.h);
  }
}

class ProductTracker extends StatelessWidget {
  const ProductTracker({super.key, required this.completedStepIndex});
  final int completedStepIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      child: FittedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            step(0 <= completedStepIndex, AppAssets.boxIcon, context),
            stepperDivider,
            step(1 <= completedStepIndex, AppAssets.truckIcon, context),
            stepperDivider,
            step(2 <= completedStepIndex, AppAssets.boxIcon, context),
            stepperDivider,
            step(3 <= completedStepIndex, AppAssets.truckIcon, context),
          ],
        ),
      ),
    );
  }

  Widget get stepperDivider => CustomPaint(
        size: Size(50.w, 1.0), // Width and height of the line
        painter: DottedLinePainter(),
      ).marginOnly(bottom: 10.h);
  Widget step(bool isCompleted, String path, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
          width: 30.w,
          child: Image.asset(
            path,
            color: isCompleted ? context.colorScheme.primary : Colors.grey,
          ),
        ).marginOnly(bottom: 10.h),
        Icon(
          Icons.check_circle,
          color: isCompleted ? context.colorScheme.primary : Colors.grey,
        ),
      ],
    ).marginSymmetric(horizontal: 7.h);
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.shade300 // Color of the dotted line
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0 // Width of the dotted line
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5.0; // Length of each dash
    const double dashSpace = 3.0; // Space between each dash

    double currentX = 0.0;
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, size.height / 2),
        Offset(currentX + dashWidth, size.height / 2),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
