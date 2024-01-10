import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/features/dasboard/controller/dasboard_controller.dart';
import 'package:digifurniture/features/home/controller/home_controller.dart';

import '../widgets/home_view.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    ref.read(homeController).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                ref.read(dasboardController).openDrawer();
              },
              icon: Image.asset(
                AppAssets.drawer,
                height: 28.h,
                width: 28.w,
              )),
          title: Image.asset(AppAssets.homeTitle,
              height: 30.h, fit: BoxFit.fitWidth),
          actions: [
            IconButton.filledTonal(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.grey.shade200)),
                onPressed: () {
                  context.pushNamed(AppRoutes.myWishList);
                },
                icon: const Icon(Icons.favorite_border)),
            SizedBox(width: 5.w),
            IconButton.filledTonal(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.grey.shade200)),
                onPressed: () => context.pushNamed(AppRoutes.notifications),
                icon: Image.asset(
                  AppAssets.notificationIcon,
                  height: 28.h,
                  width: 28.w,
                )),
            SizedBox(width: 5.w),
          ],
        ),
        body: const HomeView());
  }
}
