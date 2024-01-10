import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';

import '../../most_popular_products/ui/widget/most_popular_products.dart';
import '../ui/widgets/most_popular/most_popular_products.dart';

final newArrivalsProductsController =
    ChangeNotifierProvider<NewArrivalsProductsController>((ref) {
  return NewArrivalsProductsController();
});

class NewArrivalsProductsController extends ChangeNotifier {
  String selectedFilter = 'All';
  List<ProductData> dummyItems = [
    ProductData('7', 'High quality chairs', AppAssets.product1, '₹ 4599',
        '₹ 5999', false, 'Sort'),
    ProductData('8', 'Living room with blue', AppAssets.product4, '₹ 2999',
        '₹ 4999', false, 'Long'),
    ProductData('8', 'Grey sofa with two pillow', AppAssets.product2, '₹ 5699',
        '₹ 5999', false, 'Sort'),
    ProductData('9', 'Grey sofa with two pillow', AppAssets.product3, '₹ 3999',
        '₹ 4999', false, 'Long'),
  ];

  toggleFavourite(int i) {
    dummyItems[i].isFavourite = !dummyItems[i].isFavourite;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
