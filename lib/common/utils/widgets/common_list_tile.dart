import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

class CommonListTile extends StatelessWidget {
  const CommonListTile(
      {super.key,
      this.imgPath,
      required this.title,
      required this.subTitle,
      required this.trailing,
      this.padding,
      this.leadingBgColor,
      this.leading,
      this.onTap});

  final String? imgPath;
  final Widget title;
  final String subTitle;
  final Widget trailing;
  final EdgeInsets? padding;
  final Color? leadingBgColor;
  final void Function()? onTap;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
            onTap: onTap,
            titleAlignment: ListTileTitleAlignment.titleHeight,
            contentPadding: padding ??
                EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: const BorderSide(color: Colors.black45)),
            leading: imgPath == null
                ? leading
                : CircleAvatar(
                    radius: 25.r,
                    backgroundColor: leadingBgColor ?? Colors.grey.shade200,
                    foregroundColor: leadingBgColor ?? Colors.grey.shade200,
                    child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor:
                          leadingBgColor ?? context.colorScheme.primary,
                      foregroundColor:
                          leadingBgColor ?? context.colorScheme.primary,
                      child: Image.asset(
                        imgPath!,
                        height: 25.h,
                        width: 25.w,
                      ),
                    ),
                  ),
            title: title,
            subtitle: subTitle.isEmpty
                ? null
                : Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
            trailing: trailing)
        .marginOnly(bottom: 10.h);
  }
}
