import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar(
      {super.key,
      this.title = '',
      this.actionButtons,
      this.color = Colors.transparent});
  final String title;
  final List<Widget>? actionButtons;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.filledTonal(
              onPressed: context.pop,
              style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.all(20.r)),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.grey.shade200)),
              icon: Icon(
                Icons.arrow_back_rounded,
                size: 30.sp,
              )),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (actionButtons != null)
            ...actionButtons!
          else
            SizedBox(
              width: 31.sp,
            ),
        ],
      ).paddingOnly(left: 10.w),
    );
  }
}
