import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

import '../../../../../common/config/theme/app_string.dart';
import 'new_arrivals_product.dart';

class NewArrivalSectionWidget extends ConsumerWidget {
  const NewArrivalSectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    return Column(
      children: [
        Row(
          children: [
            Text(
              appString.keyNewArrival,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  appString.keySeeAll,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ))
          ],
        ).paddingHorizontal(20.w),
        const NewArrivalProducts(),
      ],
    );
  }
}
