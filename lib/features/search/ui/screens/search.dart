import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/home/ui/widgets/home_search_bar.dart';
import 'package:digifurniture/features/search/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/search_products.dart';

class Search extends ConsumerStatefulWidget {
  const Search({super.key, this.isFromFilter = false});
  final bool isFromFilter;

  @override
  ConsumerState<Search> createState() => _SearchState();
}

class _SearchState extends ConsumerState<Search> {
  late FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    if (!widget.isFromFilter) {
      focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SearchBarWidget(
            isSearchScreen: true,
            node: focusNode,
          ),
          SizedBox(height: 10.h),
          const SearchProducts()
        ],
      ),
    )).paddingSymmetric(horizontal: 15.h, vertical: 15.h);
  }
}
