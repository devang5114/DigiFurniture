import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';
import 'package:digifurniture/features/my_wishlist/controller/my_wishlist_controller.dart';

import '../../most_popular_products/ui/widget/most_popular_products.dart';
import '../ui/widgets/most_popular/most_popular_products.dart';

final mostPopularProductController =
    ChangeNotifierProvider<MostPopularProductController>((ref) {
  return MostPopularProductController(ref);
});

class MostPopularProductController extends ChangeNotifier {
  MostPopularProductController(this.ref);
  Ref ref;
  String selectedFilter = 'All';

  List<ProductData> dummyItems = [
    ProductData('1', 'High quality chairs', AppAssets.product1, '₹ 4599',
        '₹ 5999', false, 'Sort'),
    ProductData('2', 'Grey sofa with two pillow', AppAssets.product2, '₹ 5699',
        '₹ 5999', false, 'Long'),
    ProductData('3', 'Grey sofa with two pillow', AppAssets.product3, '₹ 3999',
        '₹ 4999', false, 'Sort'),
    ProductData('4', 'Living room with blue', AppAssets.product4, '₹ 2999',
        '₹ 4999', false, 'Sort'),
    ProductData('5', 'Grey sofa with two pillow', AppAssets.product2, '₹ 5699',
        '₹ 5999', false, 'Sort'),
    ProductData('6', 'Grey sofa with two pillow', AppAssets.product3, '₹ 3999',
        '₹ 4999', false, 'Long'),
  ];

  toggleFavourite(int i) {
    dummyItems[i].isFavourite = !dummyItems[i].isFavourite;
    if (dummyItems[i].isFavourite) {
      ref.read(myWishlistController).addProduct(dummyItems[i], i);
    } else {
      ref.read(myWishlistController).removeProduct(dummyItems[i]);
    }
    notifyListeners();
  }

  setFavourite(ProductData product, bool val) {
    int i = dummyItems.indexOf(product);
    dummyItems[i].isFavourite = val;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}

List<ProductData> dummyItems = [
  ProductData('1', 'High quality chairs', AppAssets.product1, '₹ 4599',
      '₹ 5999', false, 'Sort'),
  ProductData('2', 'Grey sofa with two pillow', AppAssets.product2, '₹ 5699',
      '₹ 5999', false, 'Long'),
  ProductData('3', 'Grey sofa with two pillow', AppAssets.product3, '₹ 3999',
      '₹ 4999', false, 'Sort'),
  ProductData('4', 'Living room with blue', AppAssets.product4, '₹ 2999',
      '₹ 4999', false, 'Sort'),
  ProductData('5', 'Grey sofa with two pillow', AppAssets.product2, '₹ 5699',
      '₹ 5999', false, 'Sort'),
  ProductData('6', 'Grey sofa with two pillow', AppAssets.product3, '₹ 3999',
      '₹ 4999', false, 'Long'),
];
