import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/common/utils/widgets/button.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:digifurniture/features/filter/controller/search_filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/config/theme/app_string.dart';
import '../widgets/search_filters_list.dart';

class SearchFilter extends ConsumerStatefulWidget {
  const SearchFilter({this.isFromSearchScreen = false, super.key});
  final bool isFromSearchScreen;

  @override
  ConsumerState<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends ConsumerState<SearchFilter> {
  @override
  void initState() {
    super.initState();
    ref.read(searchFilterController).init();
  }

  @override
  Widget build(BuildContext context) {
    final appString = ref.watch(appStringController);
    final searchFiltersWatch = ref.watch(searchFilterController);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBar(title: appString.keySortAndFilter),
            const Expanded(child: SearchFiltersList()),
            Row(
              children: [
                Expanded(
                    child: CommonButton(
                        border: Border.all(color: context.colorScheme.primary),
                        backgroundColor: Colors.white,
                        onTap: () {
                          searchFiltersWatch.resetFilter();
                        },
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp,
                        txtColor: context.colorScheme.primary,
                        btnText: appString.keyReset)),
                SizedBox(width: 10.w),
                Expanded(
                    child: CommonButton(
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp,
                        onTap: () {
                          searchFiltersWatch.applyFilter(
                              context, widget.isFromSearchScreen);
                        },
                        btnText: appString.keyApply)),
              ],
            ).marginSymmetric(horizontal: 15.w, vertical: 20.h)
          ],
        ),
      ),
    );
  }
}
