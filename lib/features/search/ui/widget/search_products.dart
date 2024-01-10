import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/search/controller/search_controller.dart';
import 'package:digifurniture/features/search/ui/widget/search_product_card.dart';

class SearchProducts extends ConsumerWidget {
  const SearchProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchWatch = ref.watch(searchController);
    return Expanded(
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: searchWatch.dummyItems.length,
        itemBuilder: (context, index) {
          final product = searchWatch.dummyItems[index];
          return SearchProductCard(product);
        },
      ),
    );
  }
}
