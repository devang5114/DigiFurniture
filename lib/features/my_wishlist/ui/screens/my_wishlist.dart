import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/common/utils/widgets/common_app_bar.dart';

import '../../../../common/config/theme/app_string.dart';
import '../widgets/wishlist_products.dart';

class MyWishlist extends ConsumerWidget {
  const MyWishlist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appString = ref.watch(appStringController);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(title: appString.keyMyWishlist),
            const WishListProducts()
          ],
        ),
      ),
    );
  }
}
