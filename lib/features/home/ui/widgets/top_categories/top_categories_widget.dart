import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/home/ui/widgets/top_categories/top_categories_products.dart';

import '../../../../../common/config/theme/app_string.dart';

class TopCategoriesWidget extends ConsumerWidget {
  const TopCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    return Column(
      children: [
        Row(
          children: [
            Text(
              appString.keyTopCategories,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  appString.keySeeAll,
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
                ))
          ],
        ).paddingOnly(left: 20.w, right: 20.w, top: 10.h),
        const TopCategoriesProducts(),
      ],
    );
  }
}
