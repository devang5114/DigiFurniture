import 'package:digifurniture/common/config/theme/app_string.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/most_popular_section_widget.dart';

class MostPopularProducts extends ConsumerWidget {
  const MostPopularProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          CommonAppBar(
            title: appString.keyMostPopular,
          ),
          const Expanded(child: MostPopularSectionWidget())
        ],
      ),
    ));
  }
}
