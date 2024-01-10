import 'package:digifurniture/common/config/theme/theme_export.dart';
import 'package:digifurniture/features/home/ui/widgets/most_popular/most_popular_products.dart';
import 'package:digifurniture/features/my_order/ui/widgets/pending_order/pending_ordere_card.dart';
import 'package:digifurniture/features/track_order/ui/widgets/packet_in_delivery.dart';

import '../../../most_popular_products/ui/widget/most_popular_products.dart';
import 'order_status_details.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key, required this.product});
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        children: [
          PendingOrderCard(
            product,
            isTracked: true,
          ),
          const TrackerWidget(),
          Divider(
            color: Colors.grey.shade200,
            thickness: 2.h,
          ),
          const OrderStatusDetails(),
        ],
      ),
    );
  }
}
