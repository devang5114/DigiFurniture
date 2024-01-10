import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/cart/controller/shipping_address_controller.dart';
import 'package:digifurniture/features/profile/controller/address_controller.dart';
import 'package:digifurniture/features/profile/controller/help_center_controller.dart';
import 'package:digifurniture/features/profile/controller/notification_setting_controller.dart';

import '../../../../../common/utils/widgets/common_list_tile.dart';

class HelpCenterView extends ConsumerWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helpWatch = ref.watch(helpCenterController);
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.h),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(helpWatch.filter.length, (i) {
                final filter = helpWatch.filter[i];
                return FilterChip(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  backgroundColor: helpWatch.selectedFilter == filter
                      ? context.colorScheme.primary
                      : Colors.white,
                  label: Text(
                    filter,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: helpWatch.selectedFilter == filter
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  showCheckmark: false,
                  onSelected: (value) {
                    helpWatch.setFilter(filter);
                  },
                ).marginOnly(left: 5.w);
              }).toList(),
            ),
          ),
          ...List.generate(helpWatch.data.length, (index) {
            final data = helpWatch.data[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.black12)),
              child: ExpansionTile(
                collapsedBackgroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                initiallyExpanded: data.isExpanded,
                onExpansionChanged: (value) {
                  helpWatch.onChangeExpansion(index, value);
                },
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.transparent)),
                childrenPadding:
                    EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
                title: Text(data.title),
                children: [
                  Text(
                    data.data,
                    softWrap: true,
                    style: TextStyle(fontSize: 15.sp),
                  )
                ],
              ),
            );
          })
        ],
      ),
    ));
  }
}
