import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/auth/ui/widgets/sign_up/image_pick_input.dart';
import 'package:digifurniture/features/profile/controller/profile_controller.dart';

import '../../../../../common/utils/constants/app_assets.dart';

class ProfileDetailsWidget extends ConsumerWidget {
  const ProfileDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return Column(
      children: [
        ImagePickInput(
            image: profileWatch.pickedImg,
            iconPath: AppAssets.cameraProfileIcon,
            radius: 50,
            iconRadius: 17,
            onTap: () {
              profileWatch.pickProfileImage();
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dilip Kalasariya',
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
            ).marginOnly(top: 10.h),
            SizedBox(
              height: 40.h,
              width: 40.w,
              child: IconButton(
                  onPressed: () {
                    context.pushNamed(AppRoutes.profileEdit);
                  },
                  icon: Image.asset(
                    AppAssets.editIcon,
                    height: 25.h,
                  )),
            ),
          ],
        ),
        Text(
          'dipi43@gmail.com',
          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
