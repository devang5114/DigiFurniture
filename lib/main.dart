import 'package:digifurniture/common/utils/service/local_db.dart';
import 'package:flutter/services.dart';

import 'common/config/router/app_route_manager.dart';
import 'common/config/router/app_routes.dart';
import 'common/config/theme/app_theme.dart';
import 'common/config/theme/theme_export.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  await init();
  runApp(ProviderScope(
      child: EasyLocalization(
          supportedLocales: const [
        Locale('en'),
      ],
          path: 'assets/lang',
          useOnlyLangCode: true,
          startLocale: const Locale('en'),
          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => MaterialApp(
              supportedLocales: EasyLocalization.of(context)!.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: EasyLocalization.of(context)!.locale,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              themeMode: ThemeMode.light,
              darkTheme: AppTheme.darkTheme,
              onGenerateRoute: AppRouteManager.onGenerateRoute,
              initialRoute: AppRoutes.splash,
            ));
  }
}

Future<void> init() async {
  await LocalDb.instance.init();
}
