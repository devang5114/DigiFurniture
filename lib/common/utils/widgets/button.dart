// import 'package:flutter/material.dart';
//
// class Button extends StatelessWidget {
//   const Button(
//       {super.key,
//       required this.child,
//       required this.onPressed,
//       this.icon,
//       this.backgroundColor,
//       this.borderRadius = BorderRadius.zero,
//       this.height,
//       this.padding,
//       this.width,
//       this.disable = false});
//   final Widget child;
//   final void Function() onPressed;
//   final Widget? icon;
//   final Color? backgroundColor;
//   final BorderRadius borderRadius;
//   final double? height;
//   final EdgeInsets? padding;
//   final double? width;
//   final bool disable;
//
//   @override
//   Widget build(BuildContext context) {
//     if (icon != null) {
//       return ElevatedButton.icon(
//           style: ElevatedButton.styleFrom(
//               padding: padding,
//               backgroundColor: backgroundColor,
//               shape: RoundedRectangleBorder(borderRadius: borderRadius)),
//           onPressed: disable ? null : onPressed,
//           icon: icon!,
//           label: child);
//     }
//     return InkWell(
//       splashColor: Colors.white,
//       highlightColor: Colors.white,
//       onTap: () {},
//       child: Ink(
//         height: height,
//         width: width,
//         child: Container(
//           color: backgroundColor,
//           child: child,
//         ),
//       ),
//     );
//   }
// }
import 'package:digifurniture/common/utils/extentions/context_extention.dart';

import '../../config/theme/theme_export.dart';

class CommonButton extends StatelessWidget {
  final Function() onTap;
  final String btnText;
  final Color? txtColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? fontSize;
  final Color? backgroundColor;
  final BoxBorder? border;
  final FontWeight? fontWeight;
  final bool isIconButton;
  final Widget? icon;
  final bool fittedWidth;
  final EdgeInsets? padding;

  const CommonButton({
    super.key,
    this.padding,
    required this.onTap,
    required this.btnText,
    this.txtColor,
    this.height,
    this.width,
    this.fittedWidth = false,
    this.fontWeight,
    this.borderRadius,
    this.fontSize,
    this.backgroundColor,
    this.border,
    this.isIconButton = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (!isIconButton) {
      return InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        onTap: onTap,
        child: Ink(
          height: height ?? 50.h,
          width: fittedWidth ? null : width ?? context.screenWidth,
          padding: padding,
          decoration: BoxDecoration(
              color: backgroundColor ?? context.colorScheme.primary,
              borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
              border: border),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              btnText,
              style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize ?? 18,
                  color: txtColor ?? Colors.white),
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
        onTap: onTap,
        child: Ink(
          height: height ?? 50.h,
          width: width ?? context.screenWidth,
          decoration: BoxDecoration(
              color: backgroundColor ?? context.colorScheme.primary,
              borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
              border: border),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon!,
                Text(
                  btnText,
                  style: TextStyle(
                      fontWeight: fontWeight,
                      fontSize: fontSize ?? 18,
                      color: txtColor ?? Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
