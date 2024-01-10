import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/text_extention.dart';
import 'package:path/path.dart';

class FurnitureCategorysWidget extends ConsumerWidget {
  const FurnitureCategorysWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final furnitures = [
      AppAssets.sofaImg,
      AppAssets.chairImg,
      AppAssets.tubImage,
      AppAssets.wingBack,
      AppAssets.slipperImage,
      AppAssets.clubImage,
      AppAssets.occasionalImg,
      AppAssets.bergereimg,
    ];
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: 200.h,
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1, mainAxisSpacing: 15.h),
        children: furnitures
            .map((e) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push(
                            Demo(basenameWithoutExtension(e).firstCapital));
                      },
                      child: SizedBox(
                        height: 60.h,
                        width: 60.w,
                        child: Image.asset(e),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      basenameWithoutExtension(e).firstCapital,
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w600),
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}

class Demo extends StatelessWidget {
  const Demo(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: const Center(
        child: FlutterLogo(),
      ),
    );
  }
}
