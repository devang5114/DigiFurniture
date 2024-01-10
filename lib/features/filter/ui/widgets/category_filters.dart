import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

import '../../../../common/config/theme/app_string.dart';
import '../../controller/search_filter_controller.dart';

class CategoryFilters extends ConsumerWidget {
  const CategoryFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    final searchFiltersWatch = ref.watch(searchFilterController);
    final filterData = searchFiltersWatch.filterDataList[0];
    List<Filter> categoryFilters = filterData.filters;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          filterData.name,
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 14.h),
        Wrap(
            spacing: 5.w,
            children: List.generate(categoryFilters.length ~/ 2 + 1, (i) {
              final filter = categoryFilters[i];
              if (i == categoryFilters.length ~/ 2) {
                return IconButton.filled(
                        enableFeedback: true,
                        onPressed: () {
                          context.pushNamed(AppRoutes.categorySelection);
                        },
                        style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r))),
                        icon: const Icon(Icons.arrow_forward_rounded))
                    .marginOnly(left: 10.w);
              }
              return FilterChip(
                selectedColor: context.colorScheme.primary,
                selected: filter.isSelected,
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
                  searchFiltersWatch.onCategorySelect(i, value);
                },
              );
            })),
      ],
    ).marginSymmetric(
      vertical: 20.h,
      horizontal: 5.w,
    );
  }
}
