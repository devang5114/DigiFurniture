import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/auth/controller/sign_up_detail_controller.dart';

import '../../../../../common/config/theme/app_string.dart';
import '../../../../../common/utils/widgets/button.dart';
import 'detail_form.dart';
import 'image_pick_input.dart';

class SignUpDetailsView extends ConsumerWidget {
  const SignUpDetailsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailWatch = ref.watch(signUpDetailController);
    final appString = ref.watch(appStringController);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          ImagePickInput(
              iconPath: AppAssets.cameraIcon,
              image: detailWatch.pickedImg,
              onTap: () {
                detailWatch.pickProfileImage();
              },
              radius: 60.r),
          SizedBox(height: 20.h),
          Text(
            appString.keyUploadImage,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 50.h),
          const DetailForm(),
          SizedBox(height: 170.h),
          Row(
            children: [
              Expanded(
                child: CommonButton(
                    backgroundColor: Colors.white,
                    border: Border.all(color: context.colorScheme.primary),
                    onTap: () {
                      context.pushAndRemoveUntilNamed(AppRoutes.dashBoard);
                    },
                    txtColor: context.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    btnText: appString.keySkip),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: CommonButton(
                    onTap: () {
                      detailWatch.saveProfile(context);
                    },
                    fontWeight: FontWeight.w500,
                    fontSize: 17.sp,
                    btnText: appString.keyContinue),
              ),
            ],
          )
        ],
      ).paddingHorizontal(20.w),
    );
  }
}
