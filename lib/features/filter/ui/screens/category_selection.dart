import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';

import '../../../../common/config/theme/app_string.dart';
import '../../controller/search_filter_controller.dart';

class CategorySelection extends ConsumerWidget {
  const CategorySelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    final searchFiltersWatch = ref.watch(searchFilterController);
    final filterData = searchFiltersWatch.filterDataList[0];
    List<Filter> categoryFilters = filterData.filters;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(title: appString.keyCategories),
            SizedBox(height: 10.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Wrap(
                    spacing: 5.w,
                    children: List.generate(categoryFilters.length, (i) {
                      final filter = categoryFilters[i];
                      return FilterChip(
                        selectedColor: context.colorScheme.primary,
                        selected: filter.isSelected,
                        backgroundColor: Colors.white,
                        label: Text(
                          filter.name,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: filter.isSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        showCheckmark: false,
                        onSelected: (value) {
                          searchFiltersWatch.onCategorySelect(i, value);
                        },
                      );
                    })),
              ),
            ),
            CommonButton(onTap: context.pop, btnText: appString.keyApply)
                .marginSymmetric(horizontal: 20.w, vertical: 15.h)
          ],
        ),
      ),
    );
  }
}
