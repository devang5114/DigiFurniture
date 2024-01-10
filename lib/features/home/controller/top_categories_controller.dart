import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/constants/app_assets.dart';

import '../ui/widgets/top_categories/top_categories_products.dart';

final topCategoryController =
    ChangeNotifierProvider<TopCategoryController>((ref) {
  return TopCategoryController();
});

class TopCategoryController extends ChangeNotifier {
  List<TopCategoryProductModel> dummyProducts = [
    TopCategoryProductModel(
        title: 'longue Chair Sofa',
        desc: 'Design For Sofa',
        image: AppAssets.topP1,
        discount: '25-50% off'),
    TopCategoryProductModel(
        title: 'Scandinavia Couch',
        desc: 'Design For Sofa',
        image: AppAssets.topP2,
        discount: '50-80% off'),
    TopCategoryProductModel(
        title: 'Chair Living room',
        desc: 'Design For Sofa',
        image: AppAssets.topP3,
        discount: '30-40% off'),
    TopCategoryProductModel(
        title: 'Loveseat Couch Sofa',
        desc: 'Design For Sofa',
        image: AppAssets.topP4,
        discount: '70-80% off'),
  ];
}
