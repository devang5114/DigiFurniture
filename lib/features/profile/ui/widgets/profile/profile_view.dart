import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/profile/ui/widgets/profile/profile_detail.dart';
import 'package:digifurniture/features/profile/ui/widgets/profile/profile_navigation_tiles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        children: [
          const ProfileDetailsWidget(),
          Divider(
            color: Colors.grey.shade200,
            height: 30.h,
          ).marginHorizontal(20.w),
          const ProfileNavigationTiles()
        ],
      ),
    );
  }
}
