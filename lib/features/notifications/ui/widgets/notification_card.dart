import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/notifications/controller/notifications_controller.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notificationData});
  final NotificationData notificationData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: context.colorScheme.secondary,
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.black12)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30.r,
              child: Image.asset(
                notificationData.logo,
                height: 30.h,
                width: 30.w,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notificationData.title,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    notificationData.desc,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ).marginOnly(top: 20.h);
  }
}
