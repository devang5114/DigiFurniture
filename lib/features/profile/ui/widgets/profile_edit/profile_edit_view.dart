import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/text_input.dart';
import 'package:digifurniture/features/profile/controller/profile_controller.dart';
import 'package:digifurniture/features/profile/ui/widgets/profile_edit/profile_detail_form.dart';

import '../../../../../common/utils/constants/app_assets.dart';
import '../../../../auth/ui/widgets/sign_up/image_pick_input.dart';

class ProfileEditView extends ConsumerWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return SingleChildScrollView(
      child: Column(
        children: [
          ImagePickInput(
              image: profileWatch.pickedImg,
              iconPath: AppAssets.cameraProfileIcon,
              radius: 65,
              iconRadius: 19,
              onTap: () {
                profileWatch.pickProfileImage();
              }),
          const ProfileDetailForm()
        ],
      ),
    ).marginHorizontal(15.w);
  }
}
