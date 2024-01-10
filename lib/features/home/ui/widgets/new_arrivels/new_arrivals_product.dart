import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/home/controller/most_popular_products_controller.dart';
import 'package:digifurniture/features/home/controller/new_arrival_controller.dart';
import 'package:digifurniture/features/home/ui/widgets/new_arrivels/product_card.dart';

class NewArrivalProducts extends ConsumerWidget {
  const NewArrivalProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newArrivalWatch = ref.watch(newArrivalsProductsController);
    return SizedBox(
      width: context.screenWidth,
      child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              runSpacing: 20.h,
              children:
                  List.generate(newArrivalWatch.dummyItems.length, (index) {
                final item = newArrivalWatch.dummyItems[index];
                return ProductCard(index, product: item);
              }).toList())
          .marginOnly(top: 15.h),
    );
  }
}
