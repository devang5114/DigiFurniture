import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/home/controller/most_popular_products_controller.dart';

import '../../../../../common/config/theme/app_string.dart';

class MostPopularSectionHeader extends ConsumerWidget {
  const MostPopularSectionHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularItemsWatch = ref.watch(mostPopularProductController);

    final categoryNamesList = [
      'All',
      'Sofa',
      'Chair',
      'Slipper Sofa',
      'Tub',
      'Club',
      'Occasional',
      'Bergere'
    ];
    return Column(
      children: [
        SizedBox(height: 4.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(categoryNamesList.length, (index) {
            final filterName = categoryNamesList[index];
            final isSelected = popularItemsWatch.selectedFilter == filterName;
            return Theme(
              data: ThemeData(useMaterial3: false),
              child: FilterChip(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    side: BorderSide(
                        color: isSelected ? Colors.white : Colors.grey)),
                label: Text(filterName,
                    style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black)),
                backgroundColor:
                    isSelected ? context.colorScheme.primary : Colors.white,
                onSelected: (value) {
                  popularItemsWatch.selectedFilter = filterName;
                  popularItemsWatch.notifyListeners();
                },
              ).marginOnly(right: 5.w),
            );
          }).toList()),
        ).marginOnly(left: 5.w),
      ],
    );
  }
}
