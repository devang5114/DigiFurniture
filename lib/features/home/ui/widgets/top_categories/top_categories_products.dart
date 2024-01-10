import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/home/controller/most_popular_products_controller.dart';
import 'package:digifurniture/features/home/controller/top_categories_controller.dart';
import 'package:digifurniture/features/home/ui/widgets/most_popular/product_card.dart';
import 'package:digifurniture/features/home/ui/widgets/top_categories/top_category_product_card.dart';

class TopCategoriesProducts extends ConsumerWidget {
  const TopCategoriesProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topProductWatch = ref.watch(topCategoryController);
    return SizedBox(
            width: context.screenWidth,
            child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                runSpacing: 20.h,
                children: List.generate(topProductWatch.dummyProducts.length,
                    (index) {
                  final item = topProductWatch.dummyProducts[index];
                  return TopCategoryProductCard(item);
                }).toList()))
        .marginOnly(top: 10.h, bottom: 10.h);
  }
}

class TopCategoryProductModel {
  final String title;
  final String desc;
  final String image;
  final String discount;

  TopCategoryProductModel(
      {required this.title,
      required this.desc,
      required this.image,
      required this.discount});
}
