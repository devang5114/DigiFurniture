import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/home/controller/most_popular_products_controller.dart';
import 'package:digifurniture/features/home/ui/widgets/most_popular/product_card.dart';

class MostPopularProducts extends ConsumerWidget {
  const MostPopularProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularProductWatch = ref.watch(mostPopularProductController);
    return SizedBox(
      width: context.screenWidth,
      child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 20.h,
              children:
                  List.generate(popularProductWatch.dummyItems.length, (index) {
                final item = popularProductWatch.dummyItems[index];
                return ProductCard(index, product: item);
              }).toList())
          .marginOnly(top: 15.h),
    );
  }
}
