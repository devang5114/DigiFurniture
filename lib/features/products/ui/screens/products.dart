import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/extentions/context_extention.dart';
import 'package:digifurniture/common/utils/extentions/widget_extention.dart';
import 'package:digifurniture/features/dasboard/controller/dasboard_controller.dart';
import 'package:digifurniture/features/products/controller/products_controller.dart';
import 'package:digifurniture/features/products/ui/widget/products_list.dart';

import '../../../../common/config/theme/app_string.dart';
import '../../../home/ui/widgets/home_search_bar.dart';

class Products extends ConsumerStatefulWidget {
  const Products({super.key});

  @override
  ConsumerState<Products> createState() => _ProductsState();
}

class _ProductsState extends ConsumerState<Products> {
  late ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    ref.read(dasboardController).initProductsTab(controller);
    ref.read(productsController).init();
  }

  @override
  Widget build(BuildContext context) {
    final appString = ref.watch(appStringController);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(appString.keyProducts),
        ),
        body: SafeArea(
          child: ListView(
            controller: controller,
            children: [
              const SearchBarWidget(),
              SizedBox(height: 20.h),
              const Filters(),
              const ProductsList(),
              SizedBox(height: 20.h),
            ],
          ),
        ));
  }
}

class Filters extends ConsumerWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsWatch = ref.watch(productsController);
    final categoryNamesList = [
      'All',
      'Sofa',
      'Chair',
      'Slipper Sofa',
      'Tub',
      'Club',
      'Occasional',
      'Bergere'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(categoryNamesList.length, (index) {
        final filterName = categoryNamesList[index];
        final isSelected = productsWatch.selectedFilter == filterName;
        return Theme(
          data: ThemeData(useMaterial3: false),
          child: FilterChip(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side:
                    BorderSide(color: isSelected ? Colors.white : Colors.grey)),
            label: Text(filterName,
                style:
                    TextStyle(color: isSelected ? Colors.white : Colors.black)),
            backgroundColor:
                isSelected ? context.colorScheme.primary : Colors.white,
            onSelected: (value) {
              productsWatch.selectedFilter = filterName;
              productsWatch.notifyListeners();
            },
          ).marginOnly(right: 5.w),
        );
      }).toList()),
    ).marginOnly(left: 5.w);
  }
}
