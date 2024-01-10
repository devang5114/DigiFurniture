import 'dart:io';

import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/features/auth/controller/sign_up_detail_controller.dart';

class ImagePickInput extends ConsumerWidget {
  const ImagePickInput(
      {required this.iconPath,
      this.iconRadius = 20,
      required this.radius,
      this.image,
      required this.onTap,
      super.key});
  final double radius;
  final double iconRadius;
  final String iconPath;
  final File? image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: const AssetImage(
            AppAssets.imageInput,
          ),
          foregroundImage: image != null ? FileImage(image!) : null,
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                radius: iconRadius,
                backgroundImage: AssetImage(iconPath),
              ),
            ))
      ],
    );
  }
}
