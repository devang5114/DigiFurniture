import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

import '../../../../common/config/theme/app_string.dart';
import '../../controller/search_filter_controller.dart';

class SortByTypes extends ConsumerWidget {
  const SortByTypes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    final searchFiltersWatch = ref.watch(searchFilterController);
    final sortByData = searchFiltersWatch.filterDataList[1];
    final sortByFilters = sortByData.filters;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 20.h),
      Text(appString.keySortBy,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700)),
      SizedBox(height: 20.h),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(sortByFilters.length, (i) {
            final filter = sortByFilters[i];
            return FilterChip(
              selectedColor: context.colorScheme.primary,
              selected: filter.isSelected,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: const BorderSide(color: Colors.red)),
              backgroundColor: Colors.white,
              label: Text(
                filter.name,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: filter.isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              showCheckmark: false,
              onSelected: (value) {
                searchFiltersWatch.onSortByFilterChange(i, value);
              },
            ).marginOnly(right: 8.w);
          }),
        ),
      )
    ]).marginOnly(left: 5.w);
  }
}
