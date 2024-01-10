import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/filter/ui/widgets/price_range_selector.dart';
import 'package:digifurniture/features/filter/ui/widgets/rating_filters.dart';
import 'package:digifurniture/features/filter/ui/widgets/sort_by_types.dart';
import 'category_filters.dart';

class SearchFiltersList extends ConsumerWidget {
  const SearchFiltersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: const Column(
        children: [
          CategoryFilters(),
          PriceRangeSelector(),
          SortByTypes(),
          RatingFilters(),
        ],
      ),
    );
  }
}
