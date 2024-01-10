import 'package:digifurniture/common/config/router/app_routes.dart';
import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../common/utils/constants/app_const.dart';

final searchFilterController =
    ChangeNotifierProvider<SearchFilterController>((ref) {
  return SearchFilterController(ref);
});

class SearchFilterController extends ChangeNotifier {
  SearchFilterController(this.ref);
  Ref ref;
  SfRangeValues priceRange = const SfRangeValues(40.0, 80.0);
  // Position
  List<FilterData> filterDataList = [];

  init() async {
    final appString = ref.watch(appStringController);
    final categories = [
      'All',
      'Sofa',
      'Chair Sofa',
      'Tub Fan',
      'Slipper',
      'Club',
      'Jaens',
      'Chair Sofa',
      'Chair Sofa',
      'Tub Fan',
      'Club',
      'Sofa',
      'Chair Sofa',
      'Tub Fan',
      'Slipper',
      'Club',
      'Jaens',
      'Bergere',
      'Bergere',
      'Sofa',
      'Choples',
      'Chair Sofa',
      'Tub Fan',
      'Slipper',
      'Club',
      'Jaens',
      'Bergere',
      'Bergere',
      'Sofa',
      'Choples',
    ];
    final sortBy = ['Popular', 'Most Recent', 'Price High', 'Price Low'];
    final ratings = ['5', '4', '3', '2', '1'];
    filterDataList = [
      FilterData(
          name: appString.keyCategories,
          filters: List.generate(
                  categories.length,
                  (index) =>
                      Filter(id: index.toString(), name: categories[index]))
              .toList()),
      FilterData(
          name: appString.keySortBy,
          filters: List.generate(sortBy.length,
                  (index) => Filter(id: index.toString(), name: sortBy[index]))
              .toList()),
      FilterData(
          name: appString.keyRating,
          filters: List.generate(ratings.length,
                  (index) => Filter(id: index.toString(), name: ratings[index]))
              .toList()),
    ];
  }

  applyFilter(BuildContext context, bool isFromSearchScreen) {
    if (isFromSearchScreen) {
      context.pop();
      context.pushAndReplaceNamed(AppRoutes.search,
          arguments: {isFromFilterKey: true});
    } else {
      context.pushAndReplaceNamed(AppRoutes.search,
          arguments: {isFromFilterKey: true});
    }
  }

  resetFilter() {
    //
  }

  onCategorySelect(int i, bool val) {
    filterDataList[0].filters[i].isSelected = val;
    notifyListeners();
  }

  onSortByFilterChange(int i, bool val) {
    filterDataList[1].filters[i].isSelected = val;
    notifyListeners();
  }

  onChangeRatingFilter(int i, bool val) {
    filterDataList[2].filters[i].isSelected = val;
    notifyListeners();
  }

  changePriceRange(SfRangeValues val) {
    priceRange = val;
    notifyListeners();
  }
}

class FilterData {
  final String name;
  final List<Filter> filters;

  FilterData({required this.name, required this.filters});
}

class Filter {
  final String id;
  final String name;
  bool isSelected;

  Filter({required this.id, required this.name, this.isSelected = false});
}
