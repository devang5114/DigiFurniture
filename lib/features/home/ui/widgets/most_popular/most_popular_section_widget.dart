import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';

import 'most_popular_products.dart';
import 'most_popular_section_header.dart';

class MostPopularSectionWidget extends ConsumerWidget {
  const MostPopularSectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        MostPopularSectionHeader(),
        MostPopularProducts(),
      ],
    );
  }
}
